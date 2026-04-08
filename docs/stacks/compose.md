---
icon: simple/docker
---

# Compose

After successfully running `just setup-server`, you can start deploying Docker compose stacks.

Stacks provided by the project are grouped into two categories.

- **Core** - For essential services that it's recommended all users run.
- **Extra** - For optional services that users can pick and choose from.

To setup a new stack, you'll need to edit your Ansible vault with the stack's relevant configuration. Use the provided example config for each service in a stack, changing the values where needed.

Then run [`just setup-compose`](../usage/just/#docker) with the name of the stack you've just configured.

!!! tip

    After successfully configuring a new stack, remember the following:
    
    1. Lower the logging level of any applicable services. 
    
        > By default, log levels are set to be more verbose to assist with initial setup.

    1. Commit any changes made to your Ansible vault.

        > See [Git changes](../guide/setup/git/).

## Custom stacks 

The project doesn't yet support user-defined stacks via Ansible. However, you can still create your own Docker `compose.yml` files directly on the server and run them manually.

To do this, you'll need to SSH in as the dockeruser.

> e.g. `ssh dockeruser@int.example.com` or `ssh dockeruser@192.168.0.142`

Afterwards, you're free to create Docker compose stacks manually. It's recommended you place these files under `/srv/docker/adhoc`.
