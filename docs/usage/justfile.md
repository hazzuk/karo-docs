---
icon: lucide/file-terminal
---

# justfile

The karo-stack uses [just](https://github.com/casey/just), a tool to run project-specific commands. Commands are called recipes, which are stored in a file called `justfile`. `just` can be invoked from any subdirectory, not just the repository's root directory, which contains the `justfile`.

You can type `just` or `just help` to see a list of available recipes.


## Available recipes

### Debian installation

An optional way to host the Debian `preseed.cfg` file, for use over a local network.

```sh
just preseed-server
```

!!! note

    This is the only recipe that is intended to be used before the Debian server has been installed. You would run this command from another computer with port `8000` open. Clone your repositories and use a `Bash` terminal. Make sure you and have `git`, `just` and `python` installed on your system.

### Server setup

Run Ansible to provision the Debian server.

```sh
just setup-server
```

### Docker

!!! tip

    By default, `$stack` is set to 'all'. Alternatively, you can provide the name of one stack, e.g. `traefik`.

Run Ansible to deploy Docker compose stacks.

```sh
just setup-compose $stack
```

Run Ansible to down Docker compose stacks.

```sh
just down-compose $stack
```

### Ansible vault

Manage an Ansible vault.

```sh
just setup-vault $hostname
```

Edit the Ansible vault password file.

```sh
just setup-password
```

