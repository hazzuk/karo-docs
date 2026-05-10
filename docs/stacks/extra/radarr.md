---
icon: radarr
---

# Radarr

> Movie collection manager

<div class="grid cards" markdown>

- :simple-github: [radarr/radarr](https://github.com/Radarr/Radarr)
- :simple-docker: [docker.io/linuxserver/radarr](https://hub.docker.com/r/linuxserver/radarr)

</div>

```yaml
# radarr

karo_compose_radarr_enabled: false
# karo_compose_radarr_domain: "radarr.{{ karo_compose_root_domain }}"
# karo_compose_radarr_forward_auth_enabled: true

karo_compose_radarr_data_path: "" # e.g. /media/drive1/data
```

??? abstract "Notes - Radarr settings"

    !!! info "Show advanced"
        To configure all necessary settings, enable 'Show Advanced'.

    === "Media management"

        - Read [TRaSH Guides - 'Radarr Recommended Naming Scheme'](https://trash-guides.info/Radarr/Radarr-recommended-naming-scheme/).

        - Add root folder (e.g. `/data/media/movies`), read [TRaSH Guides - 'File and Folder Structure'](https://trash-guides.info/File-and-Folder-Structure/).

    === "Profiles"

        - Read [TRaSH Guides - 'Radarr How to set up Quality Profiles'](https://trash-guides.info/Radarr/radarr-setup-quality-profiles/) (optional)

    === "Indexers"

        - Setup indexers in Prowlarr

        - Options
            - RSS sync interval: `0` (optional)

                > Set this to disable all automatic release grabbing.

    === "Download clients"

        !!! info "qui client proxy"
    
            - Go to 'qui' > 'Settings' > 'Client Proxy'
            - Create client API key
                - Client name: `radarr`
                - qBittorrent instance: `main`

        - Add qBittorrent download client
            - Port: `7476`
            - URL base: `#!ini /proxy/<qui client proxy radarr api key>`
            - Category: `movies`
            - Remove completed: `false`

    === "Metadata"

        - Options
            - Certification country: `#!ini <your region>`

    === "General"

        - Host
            - Application URL: `https://radarr.example.com:443/`

        - Security
            - Authentication: `external`

                > When forward auth is enabled, you'll want to [configure authentication as external](https://wiki.servarr.com/en/radarr/faq#authentication-method).

        - Logging
            - Log level: `info`

        - Analytics
            - Send anonymous usage data: `false`

??? note "Links"

    - :lucide-bookmark: [Documentation](https://wiki.servarr.com/radarr)
    - :lucide-tag: [Releases](https://github.com/radarr/radarr/releases)
