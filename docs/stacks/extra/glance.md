---
icon: glance
---

# Glance

> Customisable dashboard

<div class="grid cards" markdown>

- :simple-github: [glanceapp/glance](https://github.com/glanceapp/glance)
- :simple-docker: [docker.io/glanceapp/glance](https://hub.docker.com/r/glanceapp/glance)

</div>

```yaml
# glance

karo_compose_glance_enabled: false
# karo_compose_glance_domain: "glance.{{ karo_compose_private_domain }}"

karo_compose_glance_config_raw: |
  # glance config
```

??? tip "Glance config"
    
    See the [Glance documentation](https://github.com/glanceapp/glance/blob/main/docs/configuration.md#preconfigured-page) regarding `glance.yml`.
