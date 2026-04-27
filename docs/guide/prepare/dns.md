---
icon: lucide/globe
---

# DNS records

You'll need a domain name to access the services you want to run. For which, you can use any registrar to acquire your domain. However for the easiest experience, it is recommended to then use [Cloudflare DNS](https://developers.cloudflare.com/dns/nameservers/update-nameservers/) as the domain's authoritative DNS provider.

!!! abstract "Static local IP address"

    It's also important that the local IPv4 address of the server is fixed. Helping ensure the server always remains connectable. You'll need the [MAC address](https://en.wikipedia.org/wiki/MAC_address) of the network interface on your motherboard or network card.
    
    > You'll likely find this in the UEFI/BIOS, as a sticker on the device, or listed on the retail box of the hardware.
    
    Then in your router, reserve an unused IPv4 address for the server's MAC address (e.g. `192.168.0.142`).

You should set the following DNS record for your domain:

| Type | Name | Target                | Comment                |
| ---- | ---- | --------------------- | ---------------------- |
| A    | `*`  | `<server local ipv4>` | server - local traffic |

!!! tip "Other DNS values"

    - The Cloudflare proxy status should always be set to `DNS only`.
    - The TTL should always be left as `Auto`.

Later on, after you've finished configuring your server, and your services are running successfully. You can read the advanced guides on configuring [external access](../advanced/access.md), and creating a [VPS proxy](../advanced/proxy/) to securely route external traffic.
