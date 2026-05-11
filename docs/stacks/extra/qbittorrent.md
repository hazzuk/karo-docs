---
icon: qbittorrent
# status: new
---

# qBittorrent

> BitTorrent client

<div class="grid cards" markdown>

- :simple-github: [qbittorrent/docker-qbittorrent-nox](https://github.com/qbittorrent/docker-qbittorrent-nox)
- :simple-docker: [qbittorrentofficial/qbittorrent-nox](https://hub.docker.com/r/qbittorrentofficial/qbittorrent-nox)

</div>

```yaml
# qbittorrent

karo_compose_qbittorrent_enabled: false
# karo_compose_qbittorrent_domain: "qbittorrent.{{ karo_compose_root_domain }}"

karo_compose_qbittorrent_downloads_path: "" # e.g. /media/drive1/data/torrents

karo_compose_qbittorrent_webui_enabled: true
```

??? abstract "Notes - qBittorrent setup"

    === "Login"

        - Obtain the generated qBittorrent web UI login credentials
            ```sh { .no-copy }
            # ssh dockeruser@homeserver.example.com
            docker logs qbittorrent
            ```

    === "Settings"

        - Read [TRaSH Guides - 'qBittorrent Basic Setup'](https://trash-guides.info/Downloaders/qBittorrent/Basic-Setup/)

        - Read [gluetun-wiki - 'qBittorrent'](https://github.com/qdm12/gluetun-wiki/blob/main/setup/popular-apps.md#qbittorrent)

    === "Reported IP"

        - Go to 'Settings' > 'Advanced'
        - IP address reported to trackers: `#!ini <vpn's static ipv4 address>` (optional)

    === "New credentials"

        - Go to 'Settings' > 'Web UI'
        - Username: `karo`
        - (:lucide-pointer: Press 'Save')
        - Password: `#!ini <new secure password>` (e.g. `openssl rand -hex 16`)
        - (:lucide-pointer: Press 'Save')

    === "Disable web UI"

        - Recreate the stack with `#!yaml karo_compose_qbittorrent_webui_enabled: false`

            ```sh { .no-copy }
            # ssh karo@homeserver.example.com
            just vault homeserver
            just compose down homeserver -s qbittorrent
            just compose up homeserver -s qbittorrent
            ```

??? note "Links"

    - :lucide-bookmark: [qBittorrent wiki](https://github.com/qbittorrent/qbittorrent/wiki/)
    - :lucide-tag: [Latest versions](https://www.qbittorrent.org/news)

## qui

> qBittorrent web UI

<div class="grid cards" markdown>

- :simple-github: [autobrr/qui](https://github.com/autobrr/qui)
- :lucide-container: [ghcr.io/autobrr/qui](https://ghcr.io/autobrr/qui)

</div>

```yaml
# qbittorrent qui

# karo_compose_qbittorrent_qui_domain: "qui.{{ karo_compose_root_domain }}"
karo_compose_qbittorrent_qui_log_level: info # trace, debug, info, warn, error

karo_compose_qbittorrent_qui_session_secret: "" # secret (`openssl rand -hex 16`)

karo_compose_qbittorrent_qui_oidc_client_id: ""
karo_compose_qbittorrent_qui_oidc_client_secret: "" # secret
```

??? abstract "Notes - qui setup"

    === "Instance"

        - Go to 'Settings' > 'Instances'

        - Add qBittorrent instance
            - Instance Name: `Homeserver`
            - URL: `http://localhost:9814`
            - Username: `karo`
            - Password: `#!ini <qbittorrent password>`

    === "Categories"

        - Go to 'Instances' > 'Homeserver' > 'Categories'

        - Add Categories (e.g. `iso`, `books`, `series`, `movies`)

            > The save path isn't required, as it'll be the [same as the category name](https://trash-guides.info/Downloaders/qBittorrent/How-to-add-categories/#paths-and-categories-breakdown).

    === "Testing"

        Test to ensure qBittorrent, qui and your VPN connection with Gluetun are all working correctly.

        - Read [TRaSH Guides - 'qBittorrent Port forwarding'](https://trash-guides.info/Downloaders/qBittorrent/Port-forwarding/)

??? note "Links"

    - :lucide-bookmark: [Documentation](https://getqui.com/docs/intro)
    - :lucide-tag: [Releases](https://github.com/autobrr/qui/releases)
