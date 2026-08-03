---
icon: lucide/package
---

Having used the preseed file for Debian's installation,
the system only installed a minimal number of packages.
Plus, a few hand-picked packages for convenience (e.g. `git`, `micro`, `btop`).

But to run the karo-stack, you'll need to install both `ansible` and `just`.

- Install additional packages:

    !!! warning "Copying commands"

        You can copy and paste commands as shown (including comments).
        Always read the commands you enter.
        And where required, change any placeholder values shown in angle brackets (e.g. `<username>`).

        Do **not** edit shell parameter expansions (e.g. `#!sh echo ${GIT_USERNAME}`), these are substituted for you.

        --8<-- "snippets.md:terminal_paste"

    --8<-- "snippets.md:pipx_install"
