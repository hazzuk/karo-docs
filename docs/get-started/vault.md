---
icon: lucide/file-lock
---

# Ansible vault

Configuration of the Ansible playbook is primarily done through variables. As these variables often contain sensitive data (e.g. a Cloudflare API token), we use [Ansible vault](https://docs.ansible.com/projects/ansible/latest/cli/ansible-vault.html) to encrypt your host_vars configuration file, aptly named `vault.yml`.

## Password setup

Before creating the vault, we'll need a strong password to encrypt it with. Use the following command to generate a 96 character password, and save the output to your password manager.

```sh
openssl rand -hex 48
```

Once you've saved the password, you'll also need to write it to a file on the system. So that Ansible can use it when encrypting/decrypting your vault.

```sh
cd /srv/stack
just setup-password
```

!!! question "Isn't writing the password to a plaintext file insecure?"

    The alternative approach would be Ansible prompting for the password each time you want to edit your vault. But seeing as you often need to edit the vault multiple times a session, this quickly becomes frustrating.
    
    This is why we store the password inside a file that Ansible can read directly. Which of course is a less secure method. However, the karo-stack has three mitigations in place to help strengthen its security. First, the file you write to is shredded after every logout. Second, the text editor (micro) explicitly has backups disabled when handling this file. And third, the file itself is only stored in system memory, on a tmpfs filesystem.

## Create your vault

With the password setup, it's time to create your vault. You can use the following command to both create and edit your vault:

```sh
just setup-vault homeserver
```

An example `vault.yml` file:

```yaml
# homeserver
#
# CONFIDENTIAL

---

karo_compose_public_domain: <domain>.<tld>
karo_compose_private_domain: <subdomain>.<domain>.<tld>

karo_compose_traefik_acme_staging_enabled: true
karo_compose_traefik_acme_staging_ca_server_url: "https://acme-staging-v02.api.letsencrypt.org/directory"

karo_compose_traefik_acme_email: cert@<domain>.<tld>
karo_compose_traefik_acme_zone_api_token: "<api_token>"
karo_compose_traefik_acme_dns_api_token: "<api_token>"
karo_compose_traefik_acme_ca_server_url: "https://acme-v02.api.letsencrypt.org/directory"

karo_compose_traefik_dashboard_enabled: true
# ...

```

After you quit the text editor, the vault is returned to its encrypted state. You can see this first-hand, by trying to read the file without Ansible:

```sh
less /srv/stack/inventory/host_vars/homeserver/vault.yml
```

You should see something similar to this:

```
$ANSIBLE_VAULT;1.1;AES256
65383464383963393464643461633...
```
