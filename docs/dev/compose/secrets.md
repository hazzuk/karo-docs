---
icon: lucide/square-asterisk
---

# Handling secrets

Stacks sometimes need to handle sensitive data (e.g. API tokens, OIDC secrets, passwords, etc).
This data should not be stored inside a Docker compose file, in plain text.
Instead, the data should be passed into a container during its creation.
This is done by using [Docker secrets](https://docs.docker.com/reference/compose-file/secrets/).

## Secrets lifecycle

### Variable to secrets file

1. For users, there no difference between declaring a sensitive value versus declaring a normal one.
    Both are variables declared inside their encrypted Ansible vault.

    ```yaml+jinja { title="inventory/host_vars/homeserver/vault.yml" hl_lines="7" .no-copy }
    example_group_foobar_enabled: true
    
    example_group_foobar_stack:
      foobar:
        domain: "foobar.{{ karo_compose_root_domain }}"
        log_level: info
        api_token: "xP5SDH57+zn4hR804VFN#p=="
    ```

1. Internally however, if a stack group decides to handle a variable as a Docker secret.
    It can explicitly define one or more secrets templates.
    Each template will normally use an individual variable declared by the user,
    which later gets replaced with the real value.

    ```yaml+jinja { title="karo-compose/templates/example_group/foobar/secrets/foobar_api_token.j2" .no-copy }
    {{ compose.foobar.api_token }}
    ```

1. When `just compose up` is run, the Ansible playbook renders each secrets template.
    These new files only exists temporarily, stored in a tmpfs filesystem (in system memory).

    ```yaml+jinja { title="/run/user/1001/karo-compose/example_group/foobar/foobar_api_token" .no-copy }
    xP5SDH57+zn4hR804VFN#p==
    ```

### Docker compose stack

1. The compose template is also rendered.
    The [top-level secrets definition](https://docs.docker.com/reference/compose-file/secrets/#:~:text=The%20top%2Dlevel%20secrets%20declaration)
    inside the compose file defines a new Docker secret.
    Its value is set based on the contents of the templated secrets file,
    rendered a few moments ago on the host filesystem.

    ```yaml+jinja { title="roles/karo-compose/templates/extra/foobar/compose.yml.j2" hl_lines="11-13" .no-copy }
    --8<-- "snippets.md:compose_secrets_example"
    ```

    !!! info "Secrets file path"

        The path to the templated secrets file is defined per stack.
        And the variable `karo_compose_secrets_path` is updated dynamically for use in the compose template.

1. Having defined a Docker secret, the service must explicitly inherit it.
    Adding the Docker secret to the service means Docker will create the secrets file inside the container
    (this similar to a bind mount).
    These secrets files are found at `/run/secrets` inside the container's filesystem.

    ```yaml+jinja { title="roles/karo-compose/templates/extra/foobar/compose.yml.j2" hl_lines="8-9" .no-copy }
    --8<-- "snippets.md:compose_secrets_example"
    ```

1. The secret can finally be used by the service.
    This is normally done with an environment variable,
    pointing to the path of the secrets file created inside the container.

    !!! warning "Service support for Docker secrets"

        The service used must support setting an environment variable or config value to the contents of a file.

    ```yaml+jinja { roles/karo-compose/templates/extra/foobar/compose.yml.j2" hl_lines="6-7" .no-copy }
    --8<-- "snippets.md:compose_secrets_example"
    ```
