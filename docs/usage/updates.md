---
icon: lucide/arrow-down-to-line
---

## Updating from v2 to v3

### Remove your fork

To help simplify the setup process, forking the `karo-stack` repo is no longer the suggested setup method.
Unless you have a specific need to maintain a fork, it is strongly recommended to switch to the public repo instead.

1. Switch to the public repo
    ```sh
    cd /srv/karo
    git remote remove origin
    git remote add origin git@github.com:hazzuk/karo-stack.git
    ```

1. Delete your karo-stack fork on github
    - Go to `github.com/<username>/karo-stack/settings#danger-zone`
    - Select 'Delete this repository'

### Use the karo-custom repo

Stacks have been moved to a new repository.
This is to allow for anyone to create their own custom stacks.
Because of this, you'll need to setup the official `karo-custom` repo.

1. Down your stacks
    ```sh
    just compose down homeserver
    ```

1. [Upgrade the karo-stack](../setup/implement/git.md#upgrade-your-karo-stack)

1. [Add the official karo-custom repo](https://hazzuk.github.io/karo-custom/)

1. Manually modify existing stack variables to match the new naming scheme
    ```sh
    just vault homeserver
    ```

    !!! info
    
        Best way to do this is to simply copy the new Ansible vault examples for each stack.
        Then move your previous values across (be mindful to use the correct indentation).

1. Up your stacks
    ```sh
    just compose up homeserver
    ```

1. Remove legacy compose files
    ```sh
    sudo rm -rf /srv/docker/{core,extra}
    ```
