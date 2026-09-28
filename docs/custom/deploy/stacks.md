---
# SPDX-FileCopyrightText: © 2026 hazzuk
#
# SPDX-License-Identifier: AGPL-3.0-only

icon: simple/docker
---

# Custom stacks

!!! tip "Use the official karo-custom repo"

    The project maintains its own karo-custom repo:
    [hazzuk/karo-custom](https://hazzuk.github.io/karo-custom/){:target='_blank'}

    It provides essential core stacks
    (a reverse proxy and OIDC provider).
    Along with a handful of optional extra tools,
    and other services for a solid media server setup.

    !!! warning

        Whilst it's not a strict requirement to use the official karo-custom repo,
        it is **strongly recommended** (unless you want to build everything yourself).
        As other custom repos will likely utilise the core stacks.

        Once added, make sure to setup both core stacks first
        (Traefik and Pocket-ID).

## Quick start guide

1. Clone the desired custom repo (e.g. `just custom get <username>`)

1. Edit your Ansible vault (e.g. `just vault homeserver`)

    <!-- editorconfig-checker-disable -->
    === "Format"

        - Add **all** custom repo stack groups

            ``` yaml
            karo_compose_stack_groups:
              - <username>_<group>
              - <username>_<group>
              - <username>_<group>
            ```

        - Add desired stack variables

            ``` yaml
            <username>_<group>_<stack>_enabled: true

            <username>_<group>_<stack>_stack:
              <service>:
                log_level: info
            ```

    === "Example"

        - Add **all** custom repo stack groups

            ``` yaml
            karo_compose_stack_groups:
              - hazzuk_core
              - hazzuk_extra
              - hazzuk_media
            ```

        - Add desired stack variables _(truncated example)_

            ``` yaml
            hazzuk_media_qbittorrent_enabled: true

            hazzuk_media_qbittorrent_stack:
              qui:
                log_level: info
            ```
    <!-- editorconfig-checker-enable -->

1. Deploy your newly configured stack(s) (e.g. `just compose up homeserver`)

!!! tip "Post-setup steps"

    After successfully configuring a new stack, remember the following:

    1. Lower the logging level of services.

    1. Commit any changes made to your Ansible vault.

        > See [Git changes](../../usage/git.md).
