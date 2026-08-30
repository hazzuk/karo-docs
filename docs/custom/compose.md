---
icon: simple/docker
---

# Compose

The karo-stack was built to better enable users to share Docker compose setups with one another.
Done by creating a standardised environment (Debian server, rootless Docker, Traefik reverse proxy, karo-stack Ansible playbook).
This commonality allows users to create compose files that are immediately compatible with any other server running the karo-stack.

To setup a new service using Docker, you'd previously have to find and adapt an existing Docker compose file.
Often one where it includes everything but the kitchen sink.
And you'd need to add or remove large parts to fit your personal setup.
Often followed up by a lot of trial and error.

With the karo-stack, it feels much closer to a plug and play style experience.
Where you can simply add new stacks from different 'karo-custom' repositories.
Or create your own.

## Deploying stacks

1. Get the relevant karo-custom repo (e.g. `just custom get example`)

1. Edit your Ansible vault (e.g. `just vault homeserver`)

    - Add **all** available stack groups

        <!-- editorconfig-checker-disable -->

        ```yaml { .no-copy hl_lines="4-5" }
        karo_compose_stack_groups:
          - hazzuk_core
          - hazzuk_extra
          - example_tools
          - example_dev
          - hazzuk_media
        ```

    - Add the desired stack variables

        ```yaml
        # foobar

        example_tools_foobar_enabled: true

        example_tools_foobar_stack:
        foobar:
          domain: "foobar.{{ karo_compose_root_domain }}"
          forward_auth_enabled: true
        ```

        <!-- editorconfig-checker-enable -->

1. Deploy your newly configured stack(s) (e.g. `just compose up homeserver`)

!!! tip "Post-setup steps"

    After successfully configuring a new stack, remember the following:

    1. Lower the logging level of services.

    1. Commit any changes made to your Ansible vault.

        > See [Git changes](../usage/git.md).

## Manual stacks

You can still create Docker `compose.yml` files directly on the server and run them manually.

To do this, you'll need to SSH in as the `dockeruser`.

> e.g. `ssh dockeruser@homeserver.example.com` or `ssh dockeruser@192.168.0.142`

Afterwards, you're free to create Docker compose stacks manually.
It's recommended you place these files under `/srv/docker/adhoc`.
