---
icon: lucide/package
---

Having used the preseed file for Debian's installation, the system only installed a minimal number of packages. Plus, a few hand-picked packages for convenience (e.g. `git`, `micro`, `btop`).

To run the karo-stack, you'll need to install both `ansible` and `just`.

!!! info "Copying commands"

    You can copy and paste commands as shown (including comments). Always read the commands you use. And where required, substitute any placeholder values.

    --8<-- "snippets.md:terminal_paste"

--8<-- "snippets.md:pipx_install"

??? question "What is the `just` command?"

    The karo-stack uses just, a tool to run project-specific commands.

    For more information on using commands created for the project, see the documentation's [just usage](../../usage/just/) page.
