---
icon: lucide/info
---

# Introduction

At its core, the karo-stack is primarily an [Ansible playbook](https://docs.ansible.com/projects/ansible/latest/playbook_guide/playbooks_intro.html), which is intended to run on a Debian Linux operating system. Although first, the project helps you to install Debian semi-automatically, by using a Debian [preseed file](https://wiki.debian.org/DebianInstaller/Preseed). This initial step configures recommended packages and host settings for you, creating a fresh environment which is immediately ready for use.

Git is used to store both the playbook and user's configuration in version control. Then running the Ansible playbook further configures the system automatically. And importantly provisions the setup of Docker. From which, the playbook can be used to run Docker containers, based on the user's personal configuration.

![](../assets/diagrams/karo-stack_architecture_v2.excalidraw.svg#only-light)
![](../assets/diagrams/karo-stack_architecture_v2_dark.svg#only-dark)
/// caption
Debian host layout
///

An important distinction compared to most self-hosted setups, is that the karo-stack configures the Docker daemon to run as rootless. Living under a separate non‑privileged user.

By default, the Docker daemon would normally run as root. But this is considered a bad practice when running third party containers. And while unlikely, a malicious container could potentially exploit a privilege escalation vulnerability, and take control of parts of the host system.

Running Docker rootless is just one example of where the karo-stack has tried to consider security and the principle of least privilege. It's also why you won't see a karo-stack ISO file to download. As it's much safer for users to download a trusted and well-maintained Debian ISO file directly from Debian.org. Then applying the karo-stack's configuration via the preseed file and Ansible playbook, with code that's easily auditable.
