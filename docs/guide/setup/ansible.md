---
icon: lucide/cog
---

# Ansible playbook

Having installed Debian, and configured both your `karo-stack` and `inventory` repos. It is now time to run the Ansible playbook.

??? tip "Restoring a previous karo-stack server"

    If you've previously configured your server and run different stacks. You can instead immediately proceed with the full setup, running the following `just` recipes:

    !!! warning

        If you've recently updated the karo-stack since last running this setup. Then please consult the project's [release notes](https://github.com/hazzuk/karo-stack/releases) first, and ensure there are no new breaking changes.

    ```sh
    just install homeserver
    ```

    ```sh
    just compose up homeserver
    ```

The playbook is separated into different Ansible roles (`karo-system`, `karo-nftables`, `karo-ssh`, `karo-git`, `karo-docker`, `karo-compose`). Each of which is responsible for configuring a specific part of the system.

These roles are mostly run together in different [grouped tasks](https://github.com/hazzuk/karo-stack/blob/main/run.yml). For now, you should run the server setup roles with the following `just` recipe:

```sh
just install homeserver
```

This will enable the nftables firewall, make minor system changes, tighten SSH security, adjust the git configuration, and install rootless Docker for a new `dockeruser`.

See the [just usage](../../usage/just/#system-setup) page for more details.
