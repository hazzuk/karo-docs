---
icon: lucide/book-copy
---

# Repositories

For security, the karo-stack's code repository doesn't automatically deploy itself onto your server during the preseed. Instead, control of what runs on a users server is left to the user.

Once you've installed Debian onto your server, you're now ready to setup the two required git repositories needed to run the karo-stack.

## GitHub account

!!! question "I haven't used git before"

    While git does have a lot of features, and in some situations can become somewhat complex. For what the karo-stack needs, using git will be relatively straight forward. Simply follow the the commands shown, and you should get everything configured correctly.

First, you'll need a [GitHub.com](https://github.com/signup) account to store your git repositories.

Alternatively, you can also use any other git forge like [Codeberg.org](https://codeberg.org/). Which is a non-profit, community-led effort that also provides git hosting (but this guide assumes you're using GitHub).

Once you've created your account. You'll need to add both your public SSH authentication, and signing keys to your [account's SSH keys](https://github.com/settings/keys).

## Repos layout

For the karo-stack to work, you'll need to create two new git repos:

- First, fork the [karo-stack repository](https://github.com/hazzuk/karo-stack/fork) to create your own copy

- Second, create a [new private repository](https://github.com/new) named `inventory`

The fork will be your version of the karo-stack codebase. Whereas `inventory` will be a much smaller private repo, which will only contain your personalised configuration.

!!! tip

    For repositories on GitHub, you can safely disable the following unwanted features:

    1. On the repo's main page, click the top right :lucide-cog: cog icon.
    1. Disable `Releases`, `Packages` and `Deployments`
    1. Next, go to the repo's `⚙️ Settings` tab
    1. Under the `Features` section, disable `Issues` and `Projects`

## Clone the repos

Connected to your server via SSH, run the following commands to clone your two repos locally:

```sh
git clone git@github.com:<username>/karo-stack.git /srv/stack
git clone git@github.com:<username>/inventory.git /srv/stack/inventory
```
