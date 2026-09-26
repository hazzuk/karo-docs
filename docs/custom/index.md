---
# SPDX-FileCopyrightText: © 2026 hazzuk
#
# SPDX-License-Identifier: AGPL-3.0-only

icon: lucide/bolt
---

# karo-custom

A karo-custom repo is a user created collection of custom Docker Compose stacks.
Designed to work smoothly within the existing Ansible playbook.
And to be freely shared, and deploy by other users on their own servers.

## Quick start guide

<!-- editorconfig-checker-disable -->

- Clone the desired custom repo (e.g. `just custom get <username>`)

- Add new variables to your Ansible vault (e.g. `just vault homeserver`)

    === "Format"

        - Custom repo's stack groups

            ``` yaml
            karo_compose_stack_groups:
              - <username>_<group>
              - <username>_<group>
              - <username>_<group>
            ```

        - And desired stack variables

            ``` yaml
            <username>_<group>_<stack>_enabled: false

            <username>_<group>_<stack>_stack:
              <service>:
                log_level: info
            ```

    === "Example"

        - Custom repo's stack groups

            ``` yaml
            karo_compose_stack_groups:
              - hazzuk_core
              - hazzuk_extra
              - hazzuk_media
            ```

        - And desired stack variables (truncated example)

            ``` yaml
            hazzuk_media_qbittorrent_enabled: false

            hazzuk_media_qbittorrent_stack:
              qui:
                log_level: info
            ```

<!-- editorconfig-checker-enable -->

!!! tip "Use the official karo-custom repo"

    The core set of compose stacks is no longer included in the main karo-stack repository.
    Instead, you will need to use the official karo-custom repo:
    [hazzuk/karo-custom](https://hazzuk.github.io/karo-custom/){:target='_blank'}

    Once added, make sure to setup all core stacks first
    (e.g. Traefik and Pocket-ID).

    !!! warning

        Whilst it's not a strict requirement to use the official custom repo,
        it is strongly recommended (unless you want to build everything yourself).
        As other custom repos almost always utilise the official core stacks.
