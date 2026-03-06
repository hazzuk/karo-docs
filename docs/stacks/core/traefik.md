---
icon: traefik
---

# Traefik

> Reverse proxy

<div class="grid cards" markdown>

- :simple-github: [traefik/traefik](https://github.com/traefik/traefik)
- :simple-docker: [docker.io/traefik](https://hub.docker.com/_/traefik)

</div>

```yaml
# traefik

# karo_compose_traefik_enabled: true
# karo_compose_traefik_dashboard_domain: "traefik.{{ karo_compose_private_domain }}"
karo_compose_traefik_log_level: debug # trace, debug, info, warn, error, fatal, panic

karo_compose_traefik_dashboard_enabled: true

karo_compose_traefik_acme_staging_enabled: true

karo_compose_traefik_acme_email: cert@example.com
karo_compose_traefik_acme_zone_api_token: "" # secret
karo_compose_traefik_acme_dns_api_token: "" # secret
```

??? tip "Create API tokens for Cloudflare DNS"

    > Guide based on the [Lego library docs](https://go-acme.github.io/lego/dns/cloudflare/index.html#api-tokens).

    Visit [dash.cloudflare.com/profile/api-tokens](https://dash.cloudflare.com/profile/api-tokens).

    Select `Create Token` > `Create Custom Token`. Create tokens for both variables:

    1. `karo_compose_traefik_acme_zone_api_token`

        - Token name: `Traefik (example.com) - Resolve domain names to Zone IDs`
        
        - Permissions: [`Zone`, `Zone`, `Read`]
        
        - Zone Resources: [`Include`, `Specific zone`, `example.com`]

    2. `karo_compose_traefik_acme_dns_api_token`

        - Token name: `Traefik (example.com) - Edit DNS for DNS-01 challenges`

        - Permissions: [`Zone`, `DNS`, `Edit`]

        - Zone Resources: [`Include`, `Specific zone`, `example.com`]

## Tinyauth

> Authentication middleware (forward auth)

<div class="grid cards" markdown>

- :simple-github: [steveiliop56/tinyauth](https://github.com/steveiliop56/tinyauth)
- :lucide-container: [ghcr.io/steveiliop56/tinyauth](https://github.com/steveiliop56/tinyauth/pkgs/container/tinyauth)

</div>

```yaml
# traefik tinyauth

# karo_compose_traefik_tinyauth_domain: "tinyauth.{{ karo_compose_public_domain }}"
karo_compose_traefik_tinyauth_log_level: info # trace, debug, info, warn, error, fatal, panic

karo_compose_traefik_tinyauth_oidc_client_id: ""
karo_compose_traefik_tinyauth_oidc_client_secret: "" # secret
```

## CetusGuard

> Docker socket proxy

<div class="grid cards" markdown>

- :simple-github: [hectorm/cetusguard](https://github.com/hectorm/cetusguard)
- :simple-docker: [docker.io/hectorm/cetusguard](https://hub.docker.com/r/hectorm/cetusguard)

</div>

```yaml
# traefik cetusguard

karo_compose_traefik_cetusguard_log_level: 7 # 0-7 (min to max verbosity)
```
