---
icon: lucide/info
---

# Introduction

At its core, the karo-stack is primarily an [Ansible playbook](https://docs.ansible.com/projects/ansible/latest/playbook_guide/playbooks_intro.html), which is intended to be run on a Debian Linux operating system. The project helps you to install Debian semi-automatically, by using a [preseed file](https://wiki.debian.org/DebianInstaller/Preseed). This configures recommended packages and host settings for you, creating a fresh environment which is immediately ready for use.

Git is then used to store the karo-stack's playbook in version control. And running the playbook further configures the host environment. And most importantly, the setup of Docker. From which, the playbook can be used to run Docker containers, based on the users personal configuration.

![](../assets/diagrams/karo-stack_architecture_v2.excalidraw.svg#only-light)
![](../assets/diagrams/karo-stack_architecture_v2_dark.svg#only-dark)
/// caption
Debian host layout
///

An important distinction compared to most self-hosted setups, is that the karo-stack configures the Docker daemon to run as rootless. Living under a separate non‑privileged user.

By default, the Docker daemon would run as root. But this is considered a bad practice when running containers from elsewhere. Whilst unlikely, a malicious container could potentially exploit a privilege escalation vulnerability, and take control of the system.

Running Docker rootless is just one example of where the karo-stack has tried to consider security and the principle of least privilege. It's also why you won't see a karo-stack ISO file to download. As it's much safer that users download a trusted ISO file directly from Debian.org. Then applying the karo-stack's configuration via the preseed file and Ansible, with code that's easily auditable.

*[principle of least privilege]: Only grant each user, process, or system the minimum access rights and permissions necessary to perform its required tasks, reducing risk of accidental or malicious misuse.
