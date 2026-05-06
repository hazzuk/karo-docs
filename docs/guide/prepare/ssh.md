---
icon: lucide/key-round
---

# SSH keys

SSH (Secure Shell Protocol) is a network protocol used to cryptographically communicate over an unsecured network. Our primary use of SSH will be to securely connect and authenticate with the Debian server.

??? question "How does SSH work?"

    You'll create an SSH key pair, which is a form of asymmetric cryptography. This means you have both a public and private key. We add the public key to places we want to access (e.g. the server, our GitHub account). Then when a request for access is made, they use the stored public key to verify a challenge. Which only someone with the private key could correctly respond to.

## Setup

The easy and secure way to store SSH keys is inside a password manager. Ideally one with a desktop client that supports acting as an SSH Agent (i.e. [1Password](https://developer.1password.com/docs/ssh/agent), [Bitwarden](https://bitwarden.com/help/ssh-agent/), [KeePassXC](https://keepassxc.org/docs/#faq-ssh-agent-how)).

!!! info "Key types"

    Generating Ed25519 keys is preferred, over using RSA or ECDSA.

Setup your password manager to act as an SSH agent on your desktop computer. Then generate your SSH key pairs. It is best to have at least two key pairs, one for authentication and ideally a second pair for signing (we'll use this with git later on).
