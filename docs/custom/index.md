---
# SPDX-FileCopyrightText: © 2026 hazzuk
#
# SPDX-License-Identifier: AGPL-3.0-only

icon: lucide/bolt
---

# karo-custom

A karo-custom repo is a user created collection of custom Docker Compose stacks.

## Quick start guide

- Clone the desired custom repo (e.g. `just custom get <username>`)

- Add new variables to your Ansible vault (e.g. `just vault homeserver`)

!!! tip "Use the official karo-custom repo"

    The core set of compose stacks is no longer included in the main karo-stack repository.
    Instead, you will need to use the official karo-custom repo:
    [hazzuk/karo-custom](https://hazzuk.github.io/karo-custom/){:target='_blank'}

    Once added, make sure to setup all core stacks first
    (e.g. Traefik and Pocket-ID).
