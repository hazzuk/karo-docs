---
icon: jellyfin
---

# Jellyfin

> Media server

<div class="grid cards" markdown>

- :simple-github: [jellyfin/jellyfin](https://github.com/jellyfin/jellyfin)
- :simple-docker: [docker.io/jellyfin/jellyfin](https://hub.docker.com/r/jellyfin/jellyfin)

</div>

```yaml
# jellyfin

karo_compose_jellyfin_enabled: false
# karo_compose_jellyfin_domain: "jellyfin.{{ karo_compose_private_domain }}"

karo_compose_jellyfin_movies_media_path: "" # e.g. /media/drive1/data/media/movies
karo_compose_jellyfin_series_media_path: "" # e.g. /media/drive1/data/media/series
```
