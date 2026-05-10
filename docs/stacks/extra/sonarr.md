---
icon: sonarr
---

# Sonarr

> TV collection manager

<div class="grid cards" markdown>

- :simple-github: [sonarr/sonarr](https://github.com/sonarr/sonarr)
- :simple-docker: [docker.io/linuxserver/sonarr](https://hub.docker.com/r/linuxserver/sonarr)

</div>

```yaml
# sonarr

karo_compose_sonarr_enabled: false
# karo_compose_sonarr_domain: "sonarr.{{ karo_compose_root_domain }}"
# karo_compose_sonarr_forward_auth_enabled: true

karo_compose_sonarr_data_path: "" # e.g. /media/drive1/data
```

??? abstract "Notes - Sonarr settings"

    !!! info "Show advanced"
        To configure all necessary settings, enable 'Show Advanced'.

    === "Media management"

        - Read [TRaSH Guides - 'Sonarr Recommended Naming Scheme'](https://trash-guides.info/Sonarr/Sonarr-recommended-naming-scheme/).

        - Add root folder (e.g. `/data/media/series`), read [TRaSH Guides - 'File and Folder Structure'](https://trash-guides.info/File-and-Folder-Structure/).

    === "Profiles"

        - Read [TRaSH Guides - 'Sonarr How to set up Quality Profiles'](https://trash-guides.info/Sonarr/sonarr-setup-quality-profiles/) (optional)

    === "Indexers"

        - Setup indexers in Prowlarr

        - Options
            - RSS sync interval: `0` (optional)

                > Set this to disable all automatic release grabbing.

    === "Download clients"

        !!! info "qui client proxy"
    
            - Go to 'qui' > 'Settings' > 'Client Proxy'
            - Create client API key
                - Client name: `sonarr`
                - qBittorrent instance: `main`

        - Add qBittorrent download client
            - Port: `7476`
            - URL base: `#!ini /proxy/<qui client proxy sonarr api key>`
            - Category: `series`
            - Remove completed: `false`

    === "General"

        - Host
            - Application URL: `https://sonarr.example.com:443/`

        - Security
            - Authentication: `external`

                > When forward auth is enabled, you'll want to [configure authentication as external](https://wiki.servarr.com/en/radarr/faq#authentication-method).

        - Logging
            - Log level: `info`

        - Analytics
            - Send anonymous usage data: `false`

??? note "Links"

    - :lucide-bookmark: [Documentation](https://wiki.servarr.com/sonarr)
    - :lucide-tag: [Releases](https://github.com/sonarr/sonarr/releases)
