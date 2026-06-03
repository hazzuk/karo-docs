---
icon: lucide/file-lock
---

# Ansible vault

Configuration of the Ansible playbook is primarily done through variables. And as these variables sometimes contain sensitive data (e.g. a Cloudflare API token), we use [Ansible vault](https://docs.ansible.com/projects/ansible/latest/cli/ansible-vault.html) to encrypt the file storing all your homeserver's configuration. Aptly named `vault.yml`.

## Password setup

Before creating the vault, we'll need a strong password to encrypt it with. Use the following command to generate a 96 character password, and save the output to your password manager.

```sh
# generate vault password
openssl rand -hex 48
```

Once you've saved the password, you'll also need to write it to a file on the system. This is so that Ansible can access it without prompting, when encrypting and decrypting your vault file.

--8<-- "snippets.md:just_password"

??? question "Isn't writing the password to a plaintext file insecure?"

    The alternative approach would be Ansible prompting for the password each time you want to edit your vault. But seeing as you often need to edit the vault multiple times a session, this quickly becomes frustrating.
    
    This is why we temporarily store the password inside a file that Ansible can read directly. Which on paper is a less secure method. However, the karo-stack has three mitigations in place to help strengthen its security. First, the file you write to is shredded after every logout. Second, the text editor micro explicitly has backups disabled when handling this file. And third, the file itself is stored on a tmpfs filesystem (in system memory).

## Create your vault

With the password setup, use the following command to both create and edit your vault:

```sh
# create ansible vault
just vault homeserver
```

Copy the example below into your vault. Edit any values that require changes.

<div class="grid" markdown>

!!! info "Commented lines"

    Commented out variables are additional settings that are completely optional.

--8<-- "snippets.md:terminal_paste"

</div>

```yaml { title="/srv/karo/inventory/host_vars/homeserver/vault.yml" }
# homeserver
#
# CONFIDENTIAL

---

# ansible

ansible_become_password: "" # system password

# karo-git

karo_git_user_email: git@example.com # github email
karo_git_user_name: username # github username
karo_git_user_signingkey: "ssh-ed25519 AAAAC3NqnC1bZEIl2..." # public ssh signing key

# karo-nftables

# ports 80 (tcp) and 443 (tcp/udp) are already accepted
# karo_nftables_accepted_tcp_ports: "" # e.g. "53, 465, 587"
# karo_nftables_accepted_udp_ports: "" # e.g. "7777, 25565"

# karo-ssh

# this port will be accepted in nftables
# karo_ssh_port: 22

# karo-compose

karo_compose_root_domain: example.com # registered domain name

karo_compose_timezone: "Europe/London" # utctime.info/timezone

# stacks
```

??? success "Encrypted state"

    After quitting the text editor, the new data is written to the vault file in an encrypted state. You can see this first-hand, by attempting to read the contents of your vault without Ansible.

    ```sh
    # check vault encryption
    less /srv/karo/inventory/host_vars/homeserver/vault.yml
    ```

    You should see a long encrypted output similar to this:

    ```yaml { .no-copy }
    $ANSIBLE_VAULT;1.1;AES256
    6538346438396339346464346163349382...
    ```
