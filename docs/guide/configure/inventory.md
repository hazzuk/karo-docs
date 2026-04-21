---
icon: lucide/backpack
---

# Inventory files

The [inventory](https://docs.ansible.com/projects/ansible/latest/inventory_guide/intro_inventory.html) repo is placed inside the karo-stack as a subdirectory to help configure Ansible. This allows the karo-stack codebase to remain unchanged. While tracking all your personal configuration separately, inside a dedicated private repository.

Your `inventory` repo will eventually look something like this:

``` { .toml .no-copy }
inventory/
├── hosts.ini # directs Ansible to the target host (e.g. localhost)
├── host_vars/
│   └── homeserver/ # name of your server
│       └── vault.yml # encrypted Ansible vault, contains almost all your configuration
└── key.txt # contains your public SSH authentication key
```

For now, create the first two files.

### `hosts.ini`

This config is used to tell the automation tool Ansible which host to target. 

```sh
micro /srv/karo/inventory/hosts.ini
```

As we'll be running Ansible on the server itself, you can simply copy the following:

```ini
[server]
homeserver ansible_host=localhost ansible_connection=local ansible_user=karo
```

??? example "Development note"

    For remote connections, use the following configuration:
    
    ```ini
    [server]
    homeserver ansible_host=192.168.122.142 ansible_port=22 ansible_connection=ssh ansible_user=karo
    ```

### `key.txt`

This file will store your public SSH authentication key.

```sh
micro /srv/karo/inventory/key.txt
```

> e.g. `ssh-ed25519 AAAAC3NqnC1bZEIl2...`
