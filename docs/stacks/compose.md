---
icon: simple/docker
---

# Compose

After running `just install homeserver`, you can start deploying Docker compose stacks.

Stacks provided by the project are grouped into two categories.

- **Core** - For essential services that it's recommended all users run.
- **Extra** - For optional services that users can pick and choose from.

To set up a new stack, edit your Ansible vault, adding the stack's different variables. Use the provided examples configs for each service, changing the values where needed. The order of variables inside your vault is irrelevant, and is down to personal preference.

Then run `just compose up homeserver`, optionally with the [name of the stack](../usage/just.md) you've configured.

??? tip "Post-setup steps"

    After successfully configuring a new stack, remember the following:
    
    1. Lower the logging level of any applicable services. 
    
        > By default, log levels are set to be more verbose to assist with initial setup.

    1. Commit any changes made to your Ansible vault.

        > See [Git changes](../setup/implement/git.md).

!!! info "Software usage"

    Please note, the documentation does not cover how to use the stacks provided. Instead, only focusing on the required steps and configuration needed to setup the software successfully.

    For more guidance on a stack's usage, please see the documentation links provided under each service.

## Custom stacks 

The project doesn't yet support user-defined stacks via Ansible. However, you can still create your own Docker `compose.yml` files directly on the server and run them manually.

To do this, you'll need to SSH in as the `dockeruser`.

> e.g. `ssh dockeruser@homeserver.example.com` or `ssh dockeruser@192.168.0.142`

Afterwards, you're free to create Docker compose stacks manually. It's recommended you place these files under `/srv/docker/adhoc`.
