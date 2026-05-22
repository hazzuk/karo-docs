---
icon: lucide/square-asterisk
---

# Handling secrets

Stacks sometimes need to handle sensitive data (e.g. API tokens, OIDC secrets, passwords, etc). This data should not be stored unencrypted in a Docker compose file. Instead, the data should be injected into a stacks container upon its creation. This can be done by using [Docker secrets](https://docs.docker.com/reference/compose-file/secrets/).

## Example secret lifecycle

1. For users, there is no difference between declaring a secret versus a normal value. For both, they simply add the variable to their encrypted vault file:

    ```yaml+jinja { title="inventory/host_vars/homeserver/vault.yml" hl_lines="5-6" .no-copy }
    # foobar
    karo_compose_foobar_enabled: true
    karo_compose_foobar_log_level: info # debug, info, warn, error

    karo_compose_foobar_secrets:
      foobar_api_token: "xP5SDH57+zn4hR804VFN#p=="
    ```

1. When `just compose up homeserver -s foobar` is run, Ansible creates a temporary environment variable. This env var is only used by the [`up.yml`](https://github.com/hazzuk/karo-stack/blob/main/roles/karo-compose/tasks/up.yml) task. And its name is the same as the Ansible variable it derives its value from.

    ```yaml+jinja { title="roles/karo-compose/tasks/up.yml" hl_lines="3-4" .no-copy }
    - name: Up compose stack
      environment:
        karo_compose_foobar_token: "{{ karo_compose_foobar_token if stack == 'foobar' else '' }}"
      community.docker.docker_compose_v2:
        state: present # docker compose up
    ```

1. The stack is now created, and the top-level secrets definition in the compose file creates a new Docker secret. Its value is set based on the environment variable of the same name, which was created when the `up.yml` task started.

    ```yaml+jinja { title="roles/karo-compose/templates/extra/foobar/compose.yml.j2" hl_lines="11-13" .no-copy }
    name: foobar
    services:

    foobar:
      container_name: foobar
      environment:
        - FOOBAR_API_TOKEN_FILE=/run/secrets/foobar_api_token
      secrets:
        - foobar_api_token

    secrets:
      foobar_api_token:
        file: /run/user/1001/karo/compose/foobar_api_token
    ```

1. With a Docker secret created, the service `foobar` explicitly inherits it. This definition will create a file inside the container itself, containing the secret.

    ```yaml+jinja { title="roles/karo-compose/templates/extra/foobar/compose.yml.j2" hl_lines="8-9" .no-copy }
    name: foobar
    services:

    foobar:
      container_name: foobar
      environment:
        - FOOBAR_API_TOKEN_FILE=/run/secrets/foobar_api_token
      secrets:
        - foobar_api_token

    secrets:
      foobar_api_token:
        file: /run/user/1001/karo/compose/foobar_api_token
    ```

1. Finally, the secret is used by the service by pointing an environment variable to the Docker secret file created inside the container.

    !!! info "Service support for Docker secrets"

        The service must support setting an environment variables value based on the contents of a file.

    ```yaml+jinja { roles/karo-compose/templates/extra/foobar/compose.yml.j2" hl_lines="6-7" .no-copy }
    name: foobar
    services:

    foobar:
      container_name: foobar
      environment:
        - FOOBAR_API_TOKEN_FILE=/run/secrets/foobar_api_token
      secrets:
        - foobar_api_token

    secrets:
      foobar_api_token:
        file: /run/user/1001/karo/compose/foobar_api_token
    ```

??? abstract "Summary of a secrets states"

    1. Ansible variable (stored inside an encrypted Ansible vault)

    1. Host environment variable (ephemeral to the `up.yml` Ansible task)

    1. Docker secret (used by the Docker compose definition)

    1. Container file (stored in tmpfs)

    1. Service environment variable (set by the value inside the secrets file)

## Adding secrets to stacks

See [this commit](https://github.com/hazzuk/karo-stack/commit/47ea6b3cd0a6e952ff6fff7a1fc6d9e587c327a0#diff-5c71659cadf1a925421ffc81fee8c83d76ce9b2eca961862da22c143cf6ed8cd) for an example of where a standard variable became a secret.

- Ansible variables that are handled as secrets [should be commented](https://github.com/hazzuk/karo-stack/commit/b073033651262ec1eef0114fbe6b73ead28152ff) with `# secret`.

- Use `no_log: true` on any Ansible task that handles a secret.
