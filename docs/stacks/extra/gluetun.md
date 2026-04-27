---
icon: gluetun
---

# Gluetun

> Docker VPN client

<div class="grid cards" markdown>

- :simple-github: [qdm12/gluetun](https://github.com/qdm12/gluetun)
- :simple-docker: [docker.io/qmcgaw/gluetun](https://hub.docker.com/r/qmcgaw/gluetun)

</div>

```yaml
# gluetun

karo_compose_gluetun_enabled: false
karo_compose_gluetun_log_level: info # debug, info, warning, error

karo_compose_gluetun_firewall_vpn_input_ports: "" # vpn port forwarding, e.g. 12345

karo_compose_gluetun_wireguard_config_raw: | # secret
  # wireguard config
```

??? tip "WireGuard config"

    Your VPN provider should be able to provide you with a `wireguard.conf` file.
