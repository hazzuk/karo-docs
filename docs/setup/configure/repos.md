---
icon: lucide/book-copy
---

# Repositories

## GitHub account

??? question "First time using git?"

    While git does have a lot of features,
    and in some situations can become somewhat complex.
    For what the karo-stack needs,
    using git will be relatively straight forward.
    Simply follow the the commands shown,
    and you should get everything configured correctly.

You'll need a [GitHub account](https://github.com/signup)
to store your private git repository.

Alternatively, you can also use any other git forge like
[Codeberg](https://codeberg.org/).
Which is a non-profit, community-led effort that also provides git hosting
(but this guide assumes you're using GitHub).

Once you've created your account.
You'll need to add both your public SSH authentication,
and signing keys to your [account's SSH keys](https://github.com/settings/keys).

## Inventory repo

You'll need to [create an empty private git repo](https://github.com/new)
named `karo-inventory`.
This repository will be used to store your personal configuration for the karo-stack.

??? question "Why use git?"

    Storing your configuration using git brings many benefits.
    Most importantly, it makes restoring your setup after a hardware failure
    or a move to a new system much simpler.
    Additionally, you'll get the full history of any changes you commit.
    So you can always revert back to a previous version of your configuration
    if something goes wrong.

## Clone the repos

Connected to your server via SSH,
run the following commands to clone the required repos locally.
Make sure to modify the first command to include your GitHub username.

--8<-- "snippets.md:git_clone"
