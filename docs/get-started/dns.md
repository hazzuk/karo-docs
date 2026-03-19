---
icon: lucide/globe
---

# DNS records

You'll need a domain name to access the services you want to run. And you can use any registrar to acquire your domain. But it's recommended to use [Cloudflare DNS](https://developers.cloudflare.com/dns/nameservers/update-nameservers/) as the domain's authoritative DNS provider for the simplest experience.

You should then set the following DNS records for your domain:

| Type  | Name    | Target                           | Comment                   |
| ----- | ------- | -------------------------------- | ------------------------- |
| A     | `*.int` | `<local server ipv4>`            | `local traffic (server)`  |
| A     | `int`   | `<local server ipv4>`            | `local hostname (server)` |
| CNAME | `*`     | `<public subdomain>.example.com` | `public traffic (server)` |

!!! tip "Other values"

    - The Cloudflare proxy status should always be set to `DNS only`.
    - The TTL should always be left as `Auto`.

!!! note "Dynamic DNS"

    If you setup dynamic DNS later on, the service automatically creates an A record.
    
    > e.g. `<public subdomain>` -> `<public ipv4>`
