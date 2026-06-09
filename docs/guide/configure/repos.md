---
icon: lucide/book-copy
---

# Repositories

For security, the karo-stack's code repository doesn't automatically clone itself onto your server during the preseed. Instead, control of what runs on a users server is left to the user.

You'll need to create the two git repositories required to run the karo-stack.

## GitHub account

??? question "First time using git?"

    While git does have a lot of features, and in some situations can become somewhat complex. For what the karo-stack needs, using git will be relatively straight forward. Simply follow the the commands shown, and you should get everything configured correctly.

You'll need a [GitHub.com](https://github.com/signup) account to store your git repositories.

Alternatively, you can also use any other git forge like [Codeberg.org](https://codeberg.org/). Which is a non-profit, community-led effort that also provides git hosting (but this guide assumes you're using GitHub).

Once you've created your account. You'll need to add both your public SSH authentication, and signing keys to your [account's SSH keys](https://github.com/settings/keys).

## Repos layout

For the karo-stack to work, you'll need to create two new git repos:

- First, fork the [karo-stack repository](https://github.com/hazzuk/karo-stack/fork) to create your own copy

- Second, create an empty [**private** repository](https://github.com/new) named `karo-inventory`

The fork will be your version of the karo-stack codebase. Whereas karo-inventory will be a much smaller private repo, which will only contain your personalised configuration. Storing your configuration using git is a huge convenience. As it makes restoring your setup after a hardware failure or a move to a new system simple. Additionally, you'll get the full history of any changes you commit. So you can always revert back to a previous version if something stops working.

??? tip "Disable GitHub features"

    For repositories on GitHub, you can safely disable the following unwanted features:

    1. Go to the repo's '⚙️ Settings' tab
        - Under 'Features', disable `Issues` and `Projects`
    1. Go to the repo's '<> Code' tab
        - To the right of 'About', click the :lucide-cog: cog icon
        - Disable `Releases`, `Packages` and `Deployments`

## Clone the repos

Connected to your server via SSH, run the following commands to clone your two repos locally:

--8<-- "snippets.md:git_clone"
