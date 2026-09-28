---
# SPDX-FileCopyrightText: © 2026 hazzuk
#
# SPDX-License-Identifier: AGPL-3.0-only

icon: lucide/bolt
---

# karo-custom

A karo-custom repo is a user created collection
of custom Docker Compose stack templates.
Configurable and deployed like the rest of the karo-stack using Ansible.
While also designed to be optionally shareable,
for use by others on their own homeserver.

## Overview

The karo-stack was built to better enable users to share Docker Compose setups with one another.
Done by creating a standardised environment (Debian server, rootless Docker, Traefik reverse proxy, karo-stack Ansible playbook).
This commonality allows users to create compose files that are immediately compatible with any other server running the karo-stack.

To setup a new service using Docker, you'd previously have to find and adapt an existing Docker Compose file.
Often one where it includes everything but the kitchen sink.
And you'd need to add or remove large parts to fit your personal setup.
Often followed up by a lot of trial and error.

With the karo-stack, it feels much closer to a plug and play style experience.
Where you can simply add new stacks from different 'karo-custom' repositories.
Or create your own.

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
