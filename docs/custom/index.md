---
icon: lucide/bolt
---

# karo-custom

A karo-custom repo is a user created collection of custom functionality, used to extend the capabilities of the karo-stack.
Its biggest use is for adding new Docker compose stacks.

## Add karo-custom repos

- Add the custom repo (e.g. `just custom add hazzuk`)
- Add the documented variables to your Ansible vault (e.g. `just vault homeserver`)

!!! note "Official karo-custom repo"

    The karo-stack no longer provides a default set of compose stacks.
    Instead, you will need to add the official karo-custom repo, [hazzuk/karo-custom](https://hazzuk.github.io/karo-custom/){:target='_blank'}.
