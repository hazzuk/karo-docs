# SPDX-FileCopyrightText: 2025 - 2026 hazzuk
#
# SPDX-License-Identifier: AGPL-3.0-only

# Print help
help:
    @{{ just_executable() }} --list --unsorted --list-prefix "  - " --justfile "{{ justfile() }}"

# Preview as you write
serve:
    @echo "info: 'Ctrl + C' to exit"
    -uv run zensical serve

# Build the site
build:
    uv run zensical build

latest := shell("curl -s https://api.github.com/repos/zensical/zensical/releases/latest | jq -r .name")  

[confirm("proceed? (y/N)")]  
_confirm:
    @echo

# Upgrade Zensical
upgrade version=latest:
    @echo "info: upgrading zensical to version {{version}}" 
    @just _confirm
    uv lock --upgrade-package zensical=={{version}}
