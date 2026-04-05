---
icon: lucide/globe
---

# DNS records

You'll need a domain name to access the services you want to run. And you can use any registrar to acquire your domain. But it's recommended to use [Cloudflare DNS](https://developers.cloudflare.com/dns/nameservers/update-nameservers/) as the domain's authoritative DNS provider for the simplest experience.

!!! abstract "Static local IP address"

    It's important that the local IPv4 address of the server is fixed. Helping ensure the server always remains connectable. You'll need the [MAC address](https://en.wikipedia.org/wiki/MAC_address) of the network interface on your motherboard or network card.
    
    > You'll find this as a sticker on the device, in the UEFI/BIOS, or listed on the retail box of the hardware.
    
    Then in your router, reserve an unused IPv4 address for the server's MAC address (e.g. `192.168.0.142`).

You should then set the following DNS records for your domain:

| Type  | Name    | Target                           | Comment                   |
| ----- | ------- | -------------------------------- | ------------------------- |
| A     | `*.int` | `<local server ipv4>`            | `local traffic (server)`  |
| A     | `int`   | `<local server ipv4>`            | `local hostname (server)` |
| CNAME | `*`     | `<public subdomain>.example.com` | `public traffic (server)` |

!!! tip "Other values"

    - The Cloudflare proxy status should always be set to `DNS only`.
    - The TTL should always be left as `Auto`.

!!! note "Public IP address"

    If you want to services to accessible externally, you'll need to expose your public IP address. Most residential ISP's will periodically rotate your public IPv4 address. So you'll need to use a dynamic DNS service like the one provided by the karo-stack. This will automatically create an A record in your DNS, and will update it when your IPv4 address rotates.

    > e.g. `<public subdomain>` -> `<public server ipv4>`


    Alternatively, for better security (or if you're behind CGNAT), it's recommended to rent a VPS to proxy public traffic to your server. This way you expose the public IPv4 address of the VPS, not your home network.
    
    Read the [VPS Proxy](../advanced/proxy/) guide for how to set this up.
    

