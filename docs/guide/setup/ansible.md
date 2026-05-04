---
icon: lucide/cog
---

# Ansible playbook

Having installed the Debian server, with both the `karo-stack` and `inventory` repos configured. It's now time to run the Ansible playbook.

The playbook is separated into roles (`karo-compose`, `karo-docker`, `karo-git`, `karo-nftables`, `karo-ssh`, `karo-system`), each of which is responsible for configuring a specific part of the server. These roles are often [run as a group](https://github.com/hazzuk/karo-stack/blob/main/run.yml), made easy with the following commands:

!!! tip

    Remember to run `just vault homeserver` if you want to change any configuration.

## Run server setup

This command will enable the nftables firewall, make minor system changes, tighten SSH security, adjust the git configuration, and install rootless Docker with the `dockeruser`.

```sh
just install homeserver
```

## Run compose setup

!!! warning

    Do not run this command now unless you've previously configured your stacks. Instead, run this after consulting the **Stacks** section of the documentation.

This command will deploy any Docker compose stacks the user has enabled. By default, it will setup **all** enabled stacks. Alternatively, you can provide the name of one stack, e.g. `traefik`.

```sh
just compose up homeserver
```
