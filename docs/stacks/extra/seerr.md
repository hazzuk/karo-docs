---
icon: seerr
---

# Seerr

> Media requests and discovery manager

<div class="grid cards" markdown>

- :simple-github: [seerr-team/seerr](https://github.com/seerr-team/seerr)
- :lucide-container: [ghcr.io/seerr-team/seerr](https://ghcr.io/seerr-team/seerr)

</div>

```yaml
# seerr

karo_compose_seerr_enabled: false
# karo_compose_seerr_domain: "seerr.{{ karo_compose_root_domain }}"
karo_compose_seerr_log_level: info # debug, info, warn, error
```

!!! warning

    The Seerr stack is undergoing changes and should be considered experimental.

    This is due to the recent [migration from Jellyseerr](https://docs.seerr.dev/migration-guide), and early adoption of OIDC ([pull request](https://github.com/seerr-team/seerr/pull/2715), [discussion](https://github.com/seerr-team/seerr/discussions/2721)).

??? note "Links"

    - [Documentation](https://docs.seerr.dev/)
    - [Releases](https://github.com/seerr-team/seerr/releases)
