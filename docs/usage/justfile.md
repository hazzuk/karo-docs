---
icon: lucide/file-terminal
---

# justfile

```
Available recipes:
  - help                      # Print help
  - preseed-server            # Host the Debian preseed.cfg file for use over a local network
  - setup-server              # Run Ansible to provision the Debian server
  - setup-compose stack='all' # Run Ansible to deploy Docker compose stacks
  - down-compose stack='all'  # Run Ansible to down Docker compose stacks
  - setup-vault hostname      # Manage an Ansible vault
  - setup-password            # Edit the Ansible vault password file
```
