---
icon: lucide/folder-git-2
---

# Git changes

## Commit changes

Having made local changes to your `karo-inventory` repo, you'll need to 'commit' and 'push' the new changes. Ensuring your server's configuration is synced with your remote GitHub repository.

```sh
# commit inventory changes
cd /srv/karo/inventory
git add *
git commit -m "update inventory files"
git push
```

??? info "SSH key prompts"

    Your desktop password manager might prompt you when running git commands. Using both your SSH signing key, to sign your git commits. And SSH auth key, to authenticate access with your remote repository.

You should repeat these commands after making any new substantial changes to your repository. 

## Upgrade your karo-stack

It's recommended to keep your fork of the `karo-stack` repo up to date with the original repository. The following commands assume you've only made changes to files inside your inventory.

!!! warning

    Make sure to read the karo-stack's [release notes](https://github.com/hazzuk/karo-stack/releases) first. And check for any breaking changes before upgrading.

    It's also recommended to stop any stack's you're currently running with `just compose down homeserver`.

```sh
# download karo-stack updates
cd /srv/karo
git remote add upstream https://github.com/hazzuk/karo-stack.git
git fetch upstream
git switch main
```

```sh
# upgrade karo-stack repo
git merge upstream/main
```

```sh
# sync remote karo-stack repo
git push origin main
```

## Next steps

Having installed your homeserver. The next step would be to look at running your Docker stacks. See the [stacks](../../stacks/compose.md) section for more details.
