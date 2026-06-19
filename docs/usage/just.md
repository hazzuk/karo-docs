---
icon: lucide/file-terminal
---

# just

The karo-stack uses [just](https://github.com/casey/just), a tool to run project-specific commands. Each `just` command is called a recipe, these recipes help simplify common commands you'll need to run when using the project.

??? example "Original command vs just recipe"

    This is the main Ansible playbook command:

    - `#!sh ansible-playbook run.yml --tags install --limit "homeserver"`

    But the karo-stack uses just to provide a simplified command (similar to an alias):

    - `#!sh just install homeserver` (Running this actually runs the command shown above)

The `just` recipes can be invoked from any subdirectory. And you can type `just` to see a full list of available recipes:

```sh { .no-copy }
> just

Available recipes:
  - preseed platform='server'              # Host preseed.cfg
  - install hostname=''                    # Setup a system
  - compose action hostname='' stack='all' # Deploy/remove stacks
  - vault hostname                         # Manage a vault
  - password                               # Set password
  - wireguard                              # Generate key pair
```

## System setup

### :lucide-monitor-check: `install`

Run Ansible to configure the core components of your system.

!!! example "Recipe examples"

    ```sh { .no-copy }
    # runs the main ansible roles to setup 'homeserver'
    just install homeserver
    ```

    ```sh { .no-copy }
    # runs the main ansible roles to setup 'proxyserver'
    just install proxyserver
    ```

### :lucide-container: `compose`

Run Ansible to deploy or remove Docker compose stacks.

!!! example "Recipe examples"

    ```sh { .no-copy }
    # setup on 'homeserver' all enabled stacks
    just compose up homeserver
    ```

    ```sh { .no-copy }
    # setup on 'homeserver' the 'traefik' stack (if enabled)
    just compose up homeserver -s traefik
    ```

    ```sh { .no-copy }
    # remove on 'homeserver' all enabled stacks
    just compose down homeserver
    ```

    ```sh { .no-copy }
    # remove on 'proxyserver' the 'proxy' stack (if enabled)
    just compose down proxyserver -s proxy
    ```

    !!! note "Stack data"

        Using `just compose down` is the same as `docker compose down`, meaning stack data will persist.

## Ansible vault

### :lucide-file-lock: `vault`

Create or edit an Ansible vault.

!!! example "Recipe example"

    ```sh { .no-copy }
    # create or edit an ansible vault inside 'inventory/host_vars/homeserver/vault.yml' 
    just vault homeserver
    ```

### :lucide-key-square: `password`

Create or edit a temporary Ansible vault password file.

!!! example "Recipe example"

    ```sh { .no-copy }
    # create or edit the ansible vault password file inside '/run/user/1000/karo/ansible/vault_pass'
    just password
    ```

## Debian install

### :lucide-sprout: `preseed`

An optional preseed method, running a Python webserver to host the Debian `preseed.cfg` file. Making it accessible for use over a local network.

!!! example "Recipe examples"

    ```sh { .no-copy }
    # starts a python webserver to host 'debian/server/d-i/trixie/preseed.cfg'
    just preseed server
    ```

    ```sh { .no-copy }
    # starts a python webserver to host 'debian/desktop/d-i/trixie/preseed.cfg'
    just preseed desktop
    ```

    !!! note "When to use this recipe"

        For use by advanced users, or when testing changes to the preseed file. See [this guide](../setup/debian/preseed.md) for details.
