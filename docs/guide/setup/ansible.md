---
icon: lucide/cog
---

# Ansible playbook

Having installed Debian, and setup both your `karo-stack` and `karo-inventory` repos. It is now time to run the Ansible playbook.

??? tip "Restoring a previous karo-stack setup"

    If you've previously configured your vault and run different stacks. You can instead immediately proceed with the full setup, running the following `just` recipes:

    !!! warning

        If some time has passed since last running your setup. Then please consult the project's [release notes](https://github.com/hazzuk/karo-stack/releases), and ensure there are no new breaking changes.

    ```sh
    just install homeserver
    ```

    ```sh
    just compose up homeserver
    ```

The playbook is separated into different Ansible roles (`karo-system`, `karo-nftables`, `karo-ssh`, `karo-git`, `karo-docker`, `karo-compose`). Each of which is responsible for configuring a specific part of the system.

These roles are mostly run together in [grouped tasks](https://github.com/hazzuk/karo-stack/blob/main/run.yml). The first part is to run the main setup roles.

```sh
# run ansible playbook
just install homeserver
```

In short, this will enable the nftables firewall, make minor system changes, tighten SSH security, adjust the git configuration, and install rootless Docker for `dockeruser`.
