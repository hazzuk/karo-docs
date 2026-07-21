---
icon: lucide/folder-tree
---

# Repo structure

karo-custom repositories are meant to extend the karo-stack beyond what users can configure solely using their vault.
And to also provide a way for users to easily share new capabilities. 

!!! info

    Currently, karo-custom repos only support extending the karo-compose role with custom stacks.

    Please create a
    [GitHub discussion](https://github.com/hazzuk/karo-custom/discussions/new/choose)
    if you'd like to suggest other ways karo-custom repos could be utilised.

The contents of each karo-custom repo is symbolically linked to the inside of the karo-stack's Ansible playbook.
And the files are used dynamically when running relevant commands.

```toml { title="karo-custom example" .no-copy }
karo-custom/
├── karo-compose/ # ansible role to extend
│   ├── defaults/main/
│   │   └── hazzuk_media/
│   │       ├── main.yml # internal variables
│   │       └── jellyfin.yml # default variables
│   └── templates/
│       └── hazzuk_media/
│           └── jellyfin/
│               └── compose.yml.j2 # docker compose template
├── LICENSE
└── README.md
```

## Creating your karo-custom repo

!!! danger

    karo-custom repos must follow a very specific naming scheme and file structure.

    You can use [the official repo](https://github.com/hazzuk/karo-custom) as an example.

### Repo creation

1. [Create a new public GitHub repo](https://github.com/new) named `karo-custom`.

1. Either clone your new repo using git, or run `just custom add <GITHUB USERNAME>`.

### Repo location

- Repos are placed inside the `./custom` directory of the karo-stack

- Multiple repos can be added

- Repos use the author's username as their directory name
