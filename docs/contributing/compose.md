---
icon: lucide/form
---

# Compose examples

The karo-stack was built after years of manually self-hosting Docker compose files.  Lessons learnt from creating so many different stacks has helped shape the following three principles:

- **Verbose** - Stacks must be more explicit in their definitions, avoiding ambiguity. Preferring long-form syntax, and absolute paths. To create more clearly and safely defined stacks.

- **Precise** - Every line in the compose file must have a purpose. Not keeping definitions just because the original stack author included them. And any non-standard definitions should be explained in more detail.

- **Standardised** - Stacks must follow a consistent ordering and structure of definitions. Reducing potential errors, and making work across different stacks much more seamless.

## Example stack

Also see the Docker compose reference guides for [services](https://docs.docker.com/reference/compose-file/services/), [networks](https://docs.docker.com/reference/compose-file/networks/), [volumes](https://docs.docker.com/reference/compose-file/volumes/) and [secrets](https://docs.docker.com/reference/compose-file/secrets/).

```yaml+jinja title="roles/karo-compose/templates/extra/foobar/compose.yml.j2"
# SPDX-FileCopyrightText: <year> <file author>
#
# SPDX-License-Identifier: AGPL-3.0-only

# https://docs.karolabs.dev/stacks/extra/foobar

---
name: foobar
services:

  foobar:
    image: {{ karo_compose_foobar_image }}:{{ karo_compose_foobar_version }}
    container_name: foobar
    restart: {{ karo_compose_restart_policy }}
    # security
    # user: 1000:1000
    # tty: false
    # stdin_open: false
    # read_only: true
    # security_opt:
    #   - no-new-privileges:true
    # tmpfs:
    #   - /tmp:rw,noexec,nosuid,nodev
    # cap_drop:
    #   - ALL
    networks:
      - egress_foobar
      - frontend
    volumes:
      - type: bind
        source: /srv/docker/extra/foobar/config.json
        target: /app/config.json
        read_only: true
      - type: volume
        source: foobar_data
        target: /app/data
    labels:
      - traefik.enable=true
      - traefik.http.routers.foobar.rule=Host(`{{ karo_compose_foobar_domain }}`)
      - traefik.http.services.foobar.loadbalancer.server.port=1234
      # forward auth
      # - traefik.http.routers.foobar.middlewares=tinyauth
      # - tinyauth.apps.foobar.config.domain={{ karo_compose_foobar_domain }}
      # - tinyauth.apps.foobar.oauth.groups={{ karo_compose_oidc_admin_group }}
    environment:
      - LOG_LEVEL={{ karo_compose_foobar_log_level }}
      - TZ={{ karo_compose_timezone }}
      - FOOBAR_APP_TOKEN_FILE=/run/secrets/karo_compose_foobar_token
    secrets:
      - karo_compose_foobar_token

networks:
  egress_foobar:
    name: egress_foobar
    driver: bridge
    internal: false
  frontend:
    external: true

volumes:
  foobar_data:
    name: foobar_data

secrets:
  karo_compose_foobar_token:
    environment: karo_compose_foobar_token
```

!!! tip "Port mappings"

    Its unlikely you'll need to map any ports. As most stacks only use web traffic (ports 80 & 443), which will always handled by the reverse proxy. However, there may be times when new port mappings are required.

    Use the following short syntax for port mappings:

    ``` { .yaml .no-copy }
    ports:
      - HOST:CONTAINER/PROTOCOL
    ```

    Ensure you **always specify the protocol**. And for stacks that need both UDP and TCP traffic on the same port, you'll need to map the same port twice for both protocols.

## Example defaults

Any new variables must be added to the karo-compose defaults file.

!!! info

    - Each stack is first grouped by core or extra, then ordered alphabetically.

    - You'll also need to add the stack name to `karo_compose_stacks`, this defines its relative startup order.

```yaml+jinja title="roles/karo-compose/defaults/main.yml"
# foobar

karo_compose_foobar_enabled: false
karo_compose_foobar_image: docker.io/foobarorg/foobar
karo_compose_foobar_version: v1.0.0@sha256:100689790a0a0ea43ca45997e0450bc26aeb5308375b41c84dfc4f2475937ab
karo_compose_foobar_domain: "foobar.{{ karo_compose_root_domain }}"
karo_compose_foobar_log_level: info # debug, info, warn, error

karo_compose_foobar_token: "" # secret
```
