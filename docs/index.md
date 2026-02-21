---
title: Home
icon: lucide/house
---

# karo-stack

**An open-source toolkit to create a declarative Linux homeserver.**

[![GitHub Release](https://img.shields.io/github/v/release/hazzuk/karo-stack?display_name=tag&cacheSeconds=7200)](https://github.com/hazzuk/karo-stack/releases)
[![License](https://img.shields.io/github/license/hazzuk/karo-stack.svg?cacheSeconds=604800)](https://github.com/hazzuk/karo-stack/blob/main/LICENSE)
[![GitHub repo size](https://img.shields.io/github/repo-size/hazzuk/karo-stack?cacheSeconds=604800)](https://github.com/hazzuk/karo-stack)

## About

The karo-stack was created to provide a middle ground for managing a self-hosted setup. Somewhere between manually installing Docker on a bare bones server. And using an all-encompassing, abstracted solution like Proxmox or Unraid.

The first often becomes problematic when maintaining everything long-term. Whereas the second is likely overkill for the needs of most users.

This is why the karo-stack exists, built to follow four intrinsic principals:

- **Declarative**
- **Unambiguous**
- **Secure**
- **Stable**

!!! info "TL;DR"

    The karo-stack enables users to reliably and efficiently deploy a personalised self‑hosted homeserver.

    Starting with an automated installation of Debian. The server configuration tracked in git. Sensitive information encrypted inside a vault. Tasks are orchestrated using Ansible with idempotent behaviour. And self-hosted Docker stacks run as a rootless user.

    *[idempotent]: An action which, when performed multiple times, has no further effect on its subject after the first time it is performed.

## Quick start

1. Host your Debian preseed file
1. Install Debian on your server
1. Setup the karo-stack repo

## License

The karo-stack is licensed AGPL-3.0-only.
