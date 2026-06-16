---
icon: lucide/archive-restore
---

# Restore setup

If you've previously... 

- Created your `karo-stack` and `karo-inventory` repo's
- Configured your vault
- Run different Docker stacks

You can use this guide to quickly restore your previous setup.

!!! info "Installing Debian"

    You should still follow the normal guide first, from [Requirements](../setup/requirements.md) to Installation.

With Debian installed, follow these commands to quickly restore your setup:

--8<-- "snippets.md:pipx_install"

--8<-- "snippets.md:git_clone"

--8<-- "snippets.md:just_password"

!!! warning

    If some time has passed since last running your setup. Then please consult the project's [release notes](https://github.com/hazzuk/karo-stack/releases), and ensure there are no new breaking changes.

```sh
just install homeserver
```

```sh
just compose up homeserver
```
