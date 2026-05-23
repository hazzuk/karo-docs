---
icon: lucide/square-asterisk
---

# Handling secrets

Stacks sometimes need to handle sensitive data (e.g. API tokens, OIDC secrets, passwords, etc). This data should not be stored unencrypted inside a Docker compose file. Instead, the data should be injected into a container during its creation. This can be done by using [Docker secrets](https://docs.docker.com/reference/compose-file/secrets/).

## Secrets lifecycle

1. For users, there is practically no difference between declaring a secret versus declaring a normal value. Both are forms of plaintext variables, added to an encrypted Ansible vault file:

    ```yaml+jinja { title="inventory/host_vars/homeserver/vault.yml" hl_lines="5-6" .no-copy }
    # foobar
    karo_compose_foobar_enabled: true
    karo_compose_foobar_log_level: info # debug, info, warn, error

    karo_compose_foobar_secrets:
      foobar_api_token: "xP5SDH57+zn4hR804VFN#p=="
    ```

1. When `just compose up` is run, Ansible creates a temporary file with the value of the secret. This file is named after its secret (e.g. `/run/user/1001/karo/compose/foobar_api_token`), and is only used by the karo-compose [`up.yml`](https://github.com/hazzuk/karo-stack/blob/main/roles/karo-compose/tasks/up.yml) task.

1. The stack is now created, and the top-level secrets definition inside the compose file defines a new Docker secret. Its value is set based on the contents of the secrets file created a few moments ago on the host's filesystem.

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

1. Having defined a Docker secret, a service can explicitly inherit it. Adding the secret to the service means Docker will create a similar secrets file inside the container. These secrets files are found at `/run/secrets` in the container's filesystem.

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

1. Finally, the secret can be used by the service. This is normally done by setting an environment variable to the path of the secret's file created inside the container (not the host's secret file).

    !!! info "Service support for Docker secrets"

        The service must support setting an environment variable or config value to the contents of a file.

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

!!! abstract "Summary of a secrets lifecycle"

    1. Ansible variable (stored inside an encrypted Ansible vault)

    1. Host secret file (created for temporary use in the `up.yml` Ansible task)

    1. Docker secret (defined by the Docker compose file)

    1. Container secret file (found inside the container at `/run/secrets`)

    1. Service environment variable (uses the value inside the container's secret file)
