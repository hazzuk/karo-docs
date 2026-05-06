---
icon: lucide/sprout
---

# Debian preseed

The [preseed file](https://github.com/hazzuk/karo-stack/blob/main/debian/server/d-i/trixie/preseed.cfg) is a list of answers to questions, which a user would normally be prompted to complete by the Debian installer. This automates the majority of the installation, except needing to first provide a URL to your preseed file. Then later, selecting which drive to format as your new system drive (when multiple drives are attached to the system).

## Hosting the file

The easiest way for the Debian installer to access your preseed file is by hosting it via a webserver. Either with a computer on your local network, or with a site like `pastebin.com`.

One important change needs to be made to your preseed file. Which is adding your public SSH key. From this, the Debian installer will be able to automatically insert your key, into the SSH `authorized_keys` file on the server. Making first time authentication over SSH easy and secure.

=== "Manual setup"

    1. Download the [latest preseed file](https://github.com/hazzuk/karo-stack/blob/main/debian/server/d-i/trixie/preseed.cfg) from the karo-stack GitHub repo
    
    1. Find and replace `<key>` with your public SSH key

        > e.g. `ssh-ed25519 AAAAC3NqnC1bZEIl2...`
    
    1. Upload the modified file to a text storage site (e.g. [pastebin.com](https://pastebin.com/))

        !!! tip "Optional paste settings"

            - Set the paste exposure to unlisted, with a paste expiration date.
            - Don't set a password.

    1. Note down the URL for the **raw** text file, to later provide the Debian installer

=== "Automatic setup (advanced)"

    ### Preamble

    !!! info

        You'll need to have previously setup your private `inventory` git repo. As instructed in a later section of the karo-stack documentation. If this doesn't sound familiar, then please follow the manual setup guide for the preseed file.

    The karo-stack has a `justfile` recipe, which fully automates dynamically adding your public SSH key to the preseed file, then serving it via a local webserver. This method was primarily intended for rapid testing of the Debian installer during the karo-stack's development. But can equally be used by anyone with the right setup.

    !!! abstract "Requirements"

        - Unix shell (sh/bash/zsh)
        - Port `8000` (TCP) must be allowed on the host's firewall
        - Git
        - Python
        - [just](https://just.systems/man/en/packages.html)

    ### Setup

    Clone your personal karo-stack fork and private inventory repo:

    ```sh
    # GIT_USERNAME=username

    git clone git@github.com:${GIT_USERNAME}/karo-stack.git
    cd karo-stack

    git clone git@github.com:${GIT_USERNAME}/inventory.git
    cd inventory
    ```

    And if required, add/update your public SSH key inside your inventory repo:

    ```sh
    micro key.txt
    
    git add key.txt
    git commit -m "add public ssh key for preseed"
    git push
    ```

    ### Run

    After setup, simply run the following justfile recipe:

    ```sh
    just preseed server
    ```
    When later prompted for the preseed file's URL, use the IP address of the host and port 8000:

    > e.g. `192.168.0.123:8000`

    Both the default protocol (`http`) and default path of the file (`/d-i/trixie/./preseed.cfg`) are assumed by the Debian installer, when the URL doesn't include them.
