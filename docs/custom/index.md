---
# SPDX-FileCopyrightText: © 2026 hazzuk
#
# SPDX-License-Identifier: AGPL-3.0-only

icon: lucide/bolt
---

# karo-custom

A karo-custom repo is a user created collection
of templates for custom Docker Compose stacks.
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
