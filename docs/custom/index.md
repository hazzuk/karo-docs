---
icon: lucide/bolt
---

# karo-custom

A karo-custom repo is a user created collection of custom functionality,
used to extend the capabilities of the karo-stack.
Its only current use is for adding Docker compose stacks.

## Add karo-custom repos

- Get the custom repo (e.g. `just custom get hazzuk`)
- Add documented variables to your Ansible vault (e.g. `just vault homeserver`)

!!! note "Official karo-custom repo"

    The core set of compose stacks is no longer included in the main karo-stack repo.
    Instead, you will need to add the official karo-custom repo, [hazzuk/karo-custom](https://hazzuk.github.io/karo-custom/){:target='_blank'}.

    Once added, make sure to setup all core stacks first (e.g. Traefik and Pocket-ID).
