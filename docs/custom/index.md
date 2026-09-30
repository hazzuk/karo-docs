---
# SPDX-FileCopyrightText: © 2026 hazzuk
#
# SPDX-License-Identifier: AGPL-3.0-only

icon: lucide/bolt
---

# karo-custom

A karo-custom repo is a user created collection
of templates for custom Docker Compose stacks.
Configurable and deployed like the
rest of the karo-stack using Ansible.
While also designed to be shareable,
for use by others on their own homeserver.

## The problem

Docker services are defined by
[compose files](https://docs.docker.com/compose/intro/compose-application-model),
which offer a multitude of different configuration options.
When looking to setup a new service, it's the norm to use the
example compose file offered by the application's developer.
Then make the necessary changes to integrate the stack
alongside your other services.

And while there is of course a specification that
defines how compose compose files can be created.
There is no set of guidelines for
how compose files should be best written.
Nor an easy way to share a compose setup,
without requiring others to make their own changes first.

The karo-stack aims to alleviate both
these issues and improve the overall
Docker experience with the use of karo-custom repos.

## Overview

karo-custom repos were designed to be a complimentary
system for managing Docker Compose stacks.
Where compose files become templates, which can include variables
that users can substitute with their own configuration
(instead of needing to edit a compose file directly).

<!-- editorconfig-checker-disable -->

``` yaml+jinja { title="Traefik compose.yml.j2 (truncated example)" }
name: traefik
services:
  traefik:
    image: {{ stack_vars.traefik.image }}
    container_name: traefik
```

<!-- editorconfig-checker-enable -->

Stack configuration is stored beside
the rest of the user's karo-stack config,
inside their encrypted Ansible vault.
Which Ansible uses along with the
compose templates to render standard
compose.yml files, then orchestrates their deployment.

![karo-custom diagram](../assets/images/karo-custom_architecture_v1.excalidraw.svg)

/// caption
Custom stacks deployment
///

Users can pull from existing karo-custom repos
instead of having to write every stack themselves.
This helps avoid the burden of maintenance falling
solely on the shoulders of one individual.

Those who wish to write custom stacks can
rely on a standardised Docker environment,
along with detailed documentation and helpful tooling.
All working to ease the setup process,
while also promoting long-term stability and hardened security.

- :lucide-form: Templated compose files

- :lucide-file-lock: Encrypted and version controlled stack configuration

- :lucide-cog: Ansible orchestration

- :lucide-server: Standardised Docker environment

- :lucide-list-checks: Suggested compose configuration guidelines

- :lucide-bolt: Easily shareable stacks system
