---
icon: lucide/clipboard-check
---

# Requirements

You'll need the following before starting:

- Your home server hardware
- Desktop or laptop to configure the server
- Bootable USB drive
- Registered domain
- GitHub account (or similar git forge, i.e. [Codeberg](https://codeberg.org/))
- Password manager (ideally with SSH agent support, i.e. [1Password](https://developer.1password.com/docs/ssh/agent), [Bitwarden](https://bitwarden.com/help/ssh-agent/), [KeePassXC](https://keepassxc.org/docs/#faq-ssh-agent-how))

## Recommended knowledge

It's highly recommended to have a basic understanding of the following topics:

- Linux command-line
- DNS records
- Docker containers
- IP addresses
- Git version control
- SSH keys
- Port forwarding
- TLS certificates

## Suggested hardware

- 4 GB of RAM
- 2 CPU cores
- x86_64/amd64 processor

??? info "ARM CPU support"

    While there is no reason an ARM64/AArch64 processor won't work, it's not an architecture that is tested with. So your mileage may vary. If you encounter any issues, please don't hesitate to raise a [GitHub issue](https://github.com/hazzuk/karo-stack/issues/new/choose).

??? warning "Ryzen 3000 CPU's (or older)"

    If you are using an AMD Zen 1 or Zen 2 processor, you might encounter [issues with the processor's power management](https://gist.github.com/dlqqq/876d74d030f80dc899fc58a244b72df0). After installing Debian, you can fix this by adding a kernel parameter via the GRUB boot loader:

    ``` { .sh .no-copy }
    sudo micro /etc/default/grub
    # edit the file to include the following:
    # GRUB_CMDLINE_LINUX_DEFAULT="quiet processor.max_cstate=1"
    # GRUB_CMDLINE_LINUX="processor.max_cstate=1"

    sudo update-grub
    sudo reboot
    ```
