---
icon: lucide/server
---

# Server install

With the preseed file setup, Debian can now be installed onto your home server hardware.

## Debian ISO

1. Download the latest Debian release

    === "Complete ISO (3.7 GB~)"

        - [Direct download](https://cdimage.debian.org/images/release/current/amd64/iso-dvd/) `debian-1.0.0-amd64-DVD-1.iso`
        
        - [Bittorrent file](https://cdimage.debian.org/images/release/current/amd64/bt-dvd/) `debian-1.0.0-amd64-DVD-1.iso.torrent`
        
    === "Network installer ISO (800 MB~)"

        - [Direct download](https://cdimage.debian.org/images/release/current/amd64/iso-cd/) `debian-1.0.0-amd64-netinst.iso`

        - [Bittorrent file](https://cdimage.debian.org/images/release/current/amd64/bt-cd/) `debian-1.0.0-amd64-netinst.iso.torrent`

1. Install [Ventoy](https://www.ventoy.net/en/index.html) onto a 8GB+ USB 3.0 storage device

1. Move the Debian ISO file to the Ventoy directory on your removable device

1. Safely remove the USB storage device

1. Boot into the Ventoy USB on your home server

1. Select the Debian ISO file

1. (Optional) Check the ISO file integrity
    - Select `File checksum`
    - Select `Calculate sha256sum`
    - Compare the output of the checksum to the value on the [Debian website](https://cdimage.debian.org/images/release/current/amd64/iso-dvd/SHA256SUMS)

1. Select `Boot in normal mode`

## Debian installer

1. Select `Advanced options ...`
1. Select `... Automated install`
1. When prompted for the preconfiguration file, enter the URL of your the preseed file

    > e.g. `https://pastebin.com/raw/aBcdEf` or `192.168.0.123:8000`

1. Select a language
1. Select your location
1. Select a keymap to use
1. Select the disk to partition (when multiple storage devices are connected)

    !!! danger
    
        ALL DATA ON THE DISK WILL BE ERASED

1. Wait for the installer to finish and the system to reboot into Debian

    !!! question "The installer showed an error"

        If you receive an error at the end of the installer process, it's likely that you've incorrectly or forgotten to change the authorized SSH key in the preseed file's late command. The easiest solution is to fix the preseed file and run the Debian installer again.

## Login with SSH

1. Open a terminal on your desktop computer (i.e. Powershell on Windows)

1. Connect to the server using SSH

    > e.g. `ssh -A karo@homeserver.example.com` or `ssh -A karo@192.168.0.142`

    !!! info

        `ssh -A` Allows for forwarding connections to your password manager's ssh-agent.

1. When prompted, change your user's password (default is `changelater`)

1. SSH again after updating your password

??? tip "Restoring a previous karo-stack server"

    If you've previously created your `karo-stack` and `inventory` repo's, and have configured a vault. Follow these commands to quickly restore your repositories:

    ```sh
    # GIT_USERNAME=username

    git clone git@github.com:${GIT_USERNAME}/karo-stack.git /srv/karo
    git clone git@github.com:${GIT_USERNAME}/inventory.git /srv/karo/inventory
    
    cd /srv/karo
    just setup-password
    ```
    
    After this, you can skip the Configuration section and go straight to [Setup](ansible/).
