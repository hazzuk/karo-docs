---
icon: lucide/globe
---

# GoDNS

> Dynamic DNS client

<div class="grid cards" markdown>

- :simple-github: [timothyye/godns](https://github.com/timothyye/godns)
- :simple-docker: [docker.io/timothyye/godns](https://hub.docker.com/r/timothyye/godns)

</div>

```yaml
# godns

karo_compose_godns_enabled: false
# karo_compose_godns_debug_info_enabled: false

karo_compose_godns_subdomain: home

karo_compose_godns_dns_api_token: "" # secret
```

??? tip "Guide - Create an API token for Cloudflare DNS"

    Visit [dash.cloudflare.com/profile/api-tokens](https://dash.cloudflare.com/profile/api-tokens).

    Select `Create Token` > `Create Custom Token`.

    - `karo_compose_godns_dns_api_token`

        - Token name: `GoDNS (example.com) - Edit dynamic DNS record`
        
        - Permissions: [`Zone`, `DNS`, `Edit`]
        
        - Zone Resources: [`Include`, `Specific zone`, `example.com`]
