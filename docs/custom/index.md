---
icon: lucide/bolt
---

# karo-custom

A karo-custom repo is a user created collection of custom functionality, used to extend the capabilities of the karo-stack.
Its biggest use is for adding new Docker compose stacks.

```toml { title="karo-custom example" .no-copy }
hazzuk/
└── karo-compose/ # ansible role to extend
    ├── defaults/main/
    │   └── hazzuk_media/
    │       ├── main.yml # internal variables
    │       └── jellyfin.yml # default variables
    └── templates/
        └── hazzuk_media/
            └── jellyfin/
                └── compose.yml.j2 # docker compose template
```

When you add a karo-custom repo, its contents is symbolically linked to the inside of the karo-stack's Ansible playbook.
And the files are used dynamically when running relevant commands.

## Add karo-custom repos

- Add the custom repo (e.g. `just custom add hazzuk`)
- Add the documented variables to your Ansible vault (e.g. `just vault homeserver`)

!!! note "Official karo-custom repo"

    The karo-stack no longer provides a default set of compose stacks.
    Instead, you will need to add the official karo-custom repo, [hazzuk/karo-custom](https://hazzuk.github.io/karo-custom/){:target='_blank'}.
