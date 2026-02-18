# SPDX-FileCopyrightText: 2025 hazzuk
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
