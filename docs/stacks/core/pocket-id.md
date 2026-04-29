---
icon: pocket-id
---

# Pocket ID

> OIDC provider

<div class="grid cards" markdown>

- :simple-github: [pocket-id/pocket-id](https://github.com/pocket-id/pocket-id)
- :lucide-container: [ghcr.io/pocket-id/pocket-id](https://ghcr.io/pocket-id/pocket-id)

</div>

```yaml
# oidc

# karo_compose_oidc_subdomain: auth
# karo_compose_oidc_provider_name: "PocketID"
# karo_compose_oidc_admin_group: "admin"

# pocketid

# karo_compose_pocketid_enabled: true
karo_compose_pocketid_log_level: info # debug, info, warn, error

karo_compose_pocketid_encryption_key: "" # secret (`openssl rand -base64 32`)
```

??? note "Links"

    - [Documentation](https://pocket-id.org/docs/introduction)
    - [Releases](https://github.com/pocket-id/pocket-id/releases)
