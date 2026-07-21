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

## karo-compose layout

=== "Ansible role"

    ```toml { title="Extend the karo-compose Ansible role" hl_lines="2" .no-copy }
    --8<-- "snippets.md:custom_compose_filetree"
    ```

=== "Role directories"

    ```toml { title="Defaults and templates directories" hl_lines="3 7" .no-copy }
    --8<-- "snippets.md:custom_compose_filetree"
    ```

=== "Stack group directories"

    ```toml { title="Stack group directories" hl_lines="4 8" .no-copy }
    --8<-- "snippets.md:custom_compose_filetree"
    ```

    !!! info "Stack group naming"

        Stack groups must follow a strict naming convention: `<username>_<scope>`.

        Do **not** use the words `stack(s)`, `compose`, `karo`, or `custom` as the scope name.

=== "Defaults files"

    ```toml { title="Stack group defaults files" hl_lines="5-6" .no-copy }
    --8<-- "snippets.md:custom_compose_filetree"
    ```

=== "Templates"

    ```toml { title="Stack group templates" hl_lines="9-10" .no-copy }
    --8<-- "snippets.md:custom_compose_filetree"
    ```

    !!! info "Template files"

        - Template files **must** end with the `.j2` file extension

        - You can create multiple template files for each stack

            === "Templates"

                ```toml { .no-copy }
                templates/
                └── hazzuk_extra/
                    └── godns/
                        ├── compose.yml.j2
                        └── config.json.j2
                ```

            === "Deployed files"

                ```toml { .no-copy }
                /srv/
                └── docker/
                    └── hazzuk_extra/
                        └── godns/
                            ├── compose.yml.j2
                            └── config.json.j2
                ```
