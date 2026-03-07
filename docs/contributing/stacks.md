---
icon: lucide/layers-plus
---

# Adding stacks

!!! warning "Maintaining stacks"

    It's important that any stacks contributed to the project stay relatively up to date, and most importantly secure. If you wish to contribute a stack, please keep in mind that you'll be expected to continue maintaining the stack after it's merged. Any stacks without an active maintainer will be marked as deprecated, and in time, removed.

The project happily welcomes new contributions for Docker compose stacks from users. However, before proceeding it's always best to start a conversation with the maintainers first. This can be done by either raising a new [GitHub issue](https://github.com/hazzuk/karo-stack/issues), or by commenting on an existing one. And expressing your interest in contributing.

Stacks are often 'needs driven', meaning first we look at what's needed, e.g. a reverse proxy. Then we look at services that can best implement the need, e.g. Caddy, Nginx, Traefik, etc.

!!! tip

    The site [selfh.st/apps](https://selfh.st/apps/), is a great resource for finding self-hosted services.

Please keep in mind that the inclusions of any new stacks is at the sole discretion of the projects core maintainers. This is why discussing any new additions first is vital for healthy contributions. The following is a list of important aspects we try to find when assessing possible new services:

- [x] **Open-source** - Made freely available under an OSI approved license.

- [x] **Secure** - Strong security posture, regular audits, and prompt CVE response.

- [x] **Useful** - Fulfils a common need for a wide range of people.

- [x] **Mature** - Actively maintained for multiple years with consistent releases.

- [x] **Simple** - Setup, maintenance and usage is straightforward.

- [x] **Lightweight** - Install footprint is small, and memory usage is minimal.

- [x] **Performant** - Uses a fast, memory-safe, compiled language like Go, C# or Rust.

- [x] **Declarative** - Fully configurable through Docker compose or Ansible.

- [x] **OIDC** - Implements single sign-on for strong, seamless authentication.

- [x] **Proven** - Trusted by the community and organisations in production environments.

- [x] **Documented** - Clear and concise documentation for configuration and use.

- [x] **Private** - No telemetry or external data collection.
