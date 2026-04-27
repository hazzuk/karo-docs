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
karo_compose_qbittorrent_qui_oidc_client_secret: ""
```
