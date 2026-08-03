---
icon: lucide/square-asterisk
---

# Handling secrets

Stacks sometimes need to handle sensitive data (e.g. API tokens, OIDC secrets, passwords, etc).
This data should not be stored in plain text inside a Docker compose file.
Instead, the data should be passed into a container during its creation.
This is done by using [Docker secrets](https://docs.docker.com/reference/compose-file/secrets/).

## Secrets lifecycle

### Variable to secrets file

1. For users, there no discernable difference between declaring a secret versus declaring a normal value.
    Both are variables declared inside their encrypted Ansible vault.

    ```yaml+jinja { title="inventory/host_vars/homeserver/vault.yml" hl_lines="5" .no-copy }
    example_group_foobar_stack:
      foobar:
        domain: "foobar.{{ karo_compose_root_domain }}"
        log_level: info
        api_token: "xP5SDH57+zn4hR804VFN#p=="
    ```

1. However internally, the stack group explicitly maps the variable declared by the user to a secrets dictionary.

    ```yaml+jinja { title="karo-compose/defaults/main/example_group/main.yml" hl_lines="4" .no-copy }
    example_group_foobar_secrets:
      foobar_api_token: "{{ example_group_foobar_stack.foobar.api_token }}"
    ```

1. When `just compose up` is run, Ansible creates a temporary file on the server.
    Which is named after the secret, and contains the value originally defined by the user.

    > (e.g. `/run/user/1001/karo/compose/foobar_api_token`)

### Docker compose stack

1. The stack is now created, and the top-level secrets definition inside the compose file defines a new Docker secret.
    Its value is set based on the contents of the temporary secrets file created a few moments ago on the host's filesystem.

    ```yaml+jinja { title="roles/karo-compose/templates/extra/foobar/compose.yml.j2" hl_lines="11-13" .no-copy }
    --8<-- "snippets.md:compose_secrets_example"
    ```

    !!! info "Secrets file path"

        The path to the templated secrets file is defined per stack.
        And the variable `karo_compose_secrets_path` is updated dynamically for use in the compose template.

1. Having defined a Docker secret, the service must explicitly inherit it.
    Adding the secret to the service means Docker will create a similar secrets file inside the container (similar to a bind mount).
    These secrets files are found at `/run/secrets` inside the container's filesystem.

    ```yaml+jinja { title="roles/karo-compose/templates/extra/foobar/compose.yml.j2" hl_lines="8-9" .no-copy }
    --8<-- "snippets.md:compose_secrets_example"
    ```

1. The secret can finally be used by the service.
    This is normally done with an environment variable, pointing to the path of the secrets file created inside the container.

    !!! warning "Service support for Docker secrets"

        The service must support setting an environment variable or config value to the contents of a file.

    ```yaml+jinja { roles/karo-compose/templates/extra/foobar/compose.yml.j2" hl_lines="6-7" .no-copy }
    --8<-- "snippets.md:compose_secrets_example"
    ```
