---
icon: lucide/package
---

Having used the preseed file for Debian's installation, your system only installed a minimal number of packages. Plus, a few hand-picked packages for convenience (e.g. `git`, `micro`, `python3`).

To run the karo-stack, you'll need to install both `ansible` and `just`.

--8<-- "snippets.md:pipx_install"

??? question "What is the `just` command?"

    The karo-stack uses just, a tool to run project-specific commands.

    For more information on using commands created for the project, see the documentation's [just usage](../../usage/just/) page.
