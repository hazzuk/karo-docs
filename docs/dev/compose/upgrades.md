---
icon: lucide/circle-fading-arrow-up
---

# Container upgrades

Version upgrades for containers should be performed on a regularly occurring basis.
And any security updates should always be applied promptly.

The container's version is controlled by the Docker image URI value:

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

It's common for both `<registry>` and `@<digest>` to go unused when specifying an image URI.
However, for greater clarity and stronger security, both must always be set.

### Image registry

Providing an image registry avoids ambiguity about the source of the image.
And improves security by only pulling the image from the intended registry.

We define the registry, along with the project and container in the first variable:

```yaml { .no-copy }
example_group_foobar_stack_defaults:
  foobar:
    image: docker.io/foobarorg/foobar # or ghcr.io/foobarorg/foobar
```

### Image digest

The image digest is the most important security mechanism when pulling images.
While tags are mutable, meaning the same tag can be later changed to another image.
Digests are immutable, as they are unique and unchangeable.
Guaranteeing you'll always pull the exact same image.

While it's not necessary to add a tag when using a digest, it's still helpful to use both.
The digest is the secure cryptographic identifier.
Whereas the tag provides a human readable version number:

```yaml { .no-copy }
example_group_foobar_stack_defaults:
  foobar:
    version: v1.0.0@sha256:100689790a0a0ea43ca45997e0450bc26aeb5308375b41c84dfc4f247
```

## Updating stacks

Version upgrades are performed manually, and the software should always be reviewed for any new important changes.

!!! tip "Test environment"

    It's highly recommended to setup the karo-stack inside a test environment (virtual machine or second server).
    And avoid testing new updates in your live environment, unless you've made backups of your stacks.

For each container...

1. Review each subsequent release made since the current version (note any breaking changes).
    And select a recent stable version of the software (stability is preferred over new releases).

1. Prepare a test environment with the previous version of the stack running (ideally with log levels adjusted to be more verbose).

1. Update the image version in the stack's defaults file.

1. Down and up the stack to test the new version of the software, reviewing the container's logs.

    ```sh
    docker logs foobar -f
    ```

1. Make any additional changes required to the compose file or configs, then test again.

See [this Pull Request](https://github.com/hazzuk/karo-stack/pull/64/commits) for an example of the changes that might be required when updating stacks.
