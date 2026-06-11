---
icon: lucide/circle-fading-arrow-up
---

# Stack updates

Software updates for stack's provided by the project should ideally be performed on a regularly occurring basis. And any security updates should always be applied promptly.

Updates are controlled by each services Docker image URI value:

=== "Format"

    ```html { title="compose example" .no-copy }
    services:
      foobar:
        image: <registry>/<project>/<container>:<tag>@<digest>
    ```

=== "Template"

    ```yaml+jinja { title="compose.yml.j2" .no-copy }
    services:
      foobar:
        image: {{ karo_compose_foobar_image }}:{{ karo_compose_foobar_version }}
    ```

=== "Result"

    ```yaml { title="compose.yml" .no-copy }
    services:
      foobar:
        image: docker.io/foobarorg/foobar:v1.0.0@sha256:100689790a0a0ea43ca45997e0450bc26aeb5308375b41c84dfc4f2475937ab
    ```

It's common for both `<registry>` and `@<digest>` to go unused when specifying an image URI. However, for greater clarity and stronger security, both must always be set here.

### Image registry

Providing an image registry avoids ambiguity about the source of the image. And improves security by only pulling the image from the intended registry.

We define the registry, along with the project and container in the first variable:

```yaml { .no-copy }
karo_compose_foobar_image: docker.io/foobarorg/foobar
```

### Image digest

The image digest is the most important security mechanism when pulling images. While tags are mutable, where the same tag can be later changed to another image. Digests are immutable, as they are unique and unchangeable. Guaranteeing you'll always pull the exact same image.

While it's not necessary to add a tag when using a digest, it's still helpful to use both. The digest is the cryptographic identifier. Whereas the tag provides human readable version number:

```yaml { .no-copy }
karo_compose_foobar_version: v1.0.0@sha256:100689790a0a0ea43ca45997e0450bc26aeb5308375b41c84dfc4f2475937ab
```

## Updating stacks

Updates are performed manually and software needs to be reviewed for any important changes.

!!! tip "Test environment"

    It's highly recommended to setup the karo-stack inside a test environment (virtual machine or second server). And avoid testing new updates in your live environment, unless you've made backups of your stacks.

1. Follow the [list of stacks](/stacks/core/pocket-id/) provided by the docs.

1. Under each service, visit the `Releases` link (and any other applicable links).

    - Review each subsequent release made since the current defined version.

    - Note any breaking changes or features the karo-stack might want to directly utilise.

1. Select the most recent stable version of the software (stability is preferred over new releases).

    - Update the image version in `roles/karo-compose/defaults/main.yml`.

1. Where possible, temporarily adjust log levels to be more verbose.

1. With the previous version of the stack running, down it and deploy the new version.

1. Test the software and review the container logs (`docker logs foobar -f`).

1. Make any additional changes required to the compose file or configs, then test again.

See [this Pull Request](https://github.com/hazzuk/karo-stack/pull/64/commits) for an example of the changes that might be required when updating stacks.
