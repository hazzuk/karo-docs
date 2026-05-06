---
icon: lucide/folder-git-2
---

# Git changes

## Commit inventory changes

Having made local changes to your `inventory` repo, you'll need to commit and push the new files. This way, everything you've done on the server is synced with your private repository on GitHub.

```sh
cd /srv/karo/inventory

git add hosts.ini
git commit -m "add ansible hosts.ini file"

git add key.txt
git commit -m "add public ssh key file"

git add host_vars
git commit -m "add ansible vault file"

git push
```

??? info "Git setup"

    Make sure you've configured your git email, name and signing key inside [your Ansible vault](../configure/vault/#create-your-vault). And have also ran the Ansible playbook using `just install homeserver`, to configure git on the system.

    If you've set up everything correctly, your desktop's password manager might prompt you when running specific git commands. This is because it's trying to use your SSH signing key to sign your git commits.

??? tip "Future commits"

    It's important to keep your remote GitHub repo up to date with any changes you make on your server. In future, you can keep things simple by doing a more generalised commit like this:

    ```sh
    cd /srv/karo/inventory

    git add *
    git commit -m "update inventory files"
    git push
    ```

## Upgrade the karo-stack

It's recommended to keep your fork of the karo-stack up to date with the original repository. Assuming you've only made changes to files inside your inventory, you can do the following:

!!! warning

    Make sure to read the karo-stack's [release notes](https://github.com/hazzuk/karo-stack/releases) first! And check for any breaking changes before upgrading.

```sh
cd /srv/karo

git remote add upstream https://github.com/hazzuk/karo-stack.git
git fetch upstream

git switch main
git merge upstream/main
git push origin main
```

## Next steps

Having installed, configured and setup your server. The recommended next step is to look at running your Docker stacks. See the [stacks](../../stacks/compose/) section for more details.
