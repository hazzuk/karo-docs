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

These roles are mostly run together, currently grouped under two [main tasks](https://github.com/hazzuk/karo-stack/blob/main/run.yml). One manages Docker stacks, the other manages the remaining system setup. You'll need to run the latter first.

```sh
# run ansible system roles
just install homeserver
```

In short, this will enable the nftables firewall, make minor system changes, tighten SSH security, adjust the git configuration, and install rootless Docker for `dockeruser`.

??? question "Why Ansible?"

    The magic of Ansible lies in its declarative nature. Unlike a shell script, the playbook doesn't detail how to perform its tasks. Instead, it specifies the desired state of the system. Which Ansible then determines what actions (if any) are required for the system to reach that state.

    This is what leads to Ansible's idempotent behaviour. And is why Ansible is such a powerful tool for managing a homeserver. Simply put it's very good at knowing when it's doesn't have to anything at all.

    You can safely **try this for yourself** by running `just install homeserver` a second time. As you'll see, rather than repeating every action again. Ansible checks that each part of the system already matches its desired state. And skips anything that doesn't need changing.
