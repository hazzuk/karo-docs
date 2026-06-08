---
title: Home
icon: lucide/house
---

# karo-stack

**An open-source toolkit for creating a declarative Linux homeserver.**

[![GitHub Release](https://img.shields.io/github/v/release/hazzuk/karo-stack?display_name=tag&cacheSeconds=7200)](https://github.com/hazzuk/karo-stack/releases)
[![License](https://img.shields.io/github/license/hazzuk/karo-stack.svg?cacheSeconds=604800)](https://github.com/hazzuk/karo-stack/blob/main/LICENSE)
[![GitHub repo size](https://img.shields.io/github/repo-size/hazzuk/karo-stack?cacheSeconds=604800)](https://github.com/hazzuk/karo-stack)

:debian: :git: :ansible: :docker:

## About

The karo-stack aims to provide a middle ground for managing a self-hosted setup. Somewhere between manually installing Docker on a bare bones server. And using an all-encompassing, abstracted solution like Proxmox or Unraid. The first often becomes problematic when maintaining everything long-term. Whereas the second is likely overkill for the needs of most users.

This is why the karo-stack exists, built to a philosophy of four intrinsic principals:

- :lucide-book-text: **Declarative**
- :lucide-circle-check: **Unambiguous**
- :lucide-lock-keyhole: **Secure**
- :lucide-tree-pine: **Stable**

!!! info "TL;DR"

    The karo-stack enables users to reliably and efficiently deploy a personalised self‑hosted homeserver.

    Starting with an automated installation of Debian Linux. The server configuration tracked in git. Sensitive information encrypted inside a vault. Tasks are orchestrated using [Ansible](https://docs.ansible.com/projects/ansible/latest/getting_started/introduction.html) with idempotent behaviour. And self-hosted Docker stacks run securely as a rootless user.

## Quick start

1. Install Debian with a preseed file
1. Setup the karo-stack git repo
1. Run the Ansible playbook
1. Start your Docker stacks

Read the [requirements page](/guide/requirements/).

## License

The karo-stack is licensed AGPL-3.0-only.
