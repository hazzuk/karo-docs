---
icon: lucide/variable
---

# Compose defaults

Compose files for the karo-stack are created as
[Ansible templates](https://docs.ansible.com/projects/ansible/latest/playbook_guide/playbooks_templating.html),
these are processed by the Jinja templating language.
Templates are helpful as they can utilise variables, which get replaced with their values when the template is deployed.

This removes the need for users to modify compose files.
Instead, users simply define variables inside their vault, which later get passed into the template.

However, users aren't expected to define every possible variable, and they also need to know the variable names to use.
Hence, a defaults file, which contains all available variables, with default values to be overridden when needed.

## Defaults files

To add a stack (e.g. 'foobar') to your karo-custom repo, you'd need to create two defaults files.

- `main.yml` Internal variables, primarily the deployment order for stacks.

    ```yaml+jinja { title="karo-compose/defaults/main/example_group/main.yml" .no-copy }
    # docker will start stacks in this order
    # docker will stop stacks in reverse order
    example_group:
      - foobar
    ```

- `foobar.yml` Stack variables, for users to override.

    !!! info "Stack variables"

        All variables created for a stack need to be added to the stack's defaults file.

        Common variables include `image`, `version`, `domain` and `log_level`.

    ```yaml+jinja { title="karo-compose/defaults/main/example_group/foobar.yml" .no-copy }
    example_group_foobar_enabled: false

    example_group_foobar_stack_defaults:
      foobar:
        image: docker.io/foobarorg/foobar
        version: v1.0.0@sha256:100689790a0a0ea43ca45997e0450bc26aeb5308375b41c84dfc4f
        domain: "foobar.{{ karo_compose_root_domain }}"
        log_level: info # debug, info, warn, error
        forward_auth_enabled: false
        api_token: ""
    ```

## Variable precedence

Unlike simple variables (e.g. `name: value`),
[dictionary variables](https://docs.ansible.com/projects/ansible/latest/playbook_guide/playbooks_variables.html#dictionary-variables)
aren't combined when two of the same name exist between the defaults file and user's inventory.
Instead, one will take
[precedence](https://docs.ansible.com/projects/ansible/latest/playbook_guide/playbooks_variables.html#variable-precedence-where-should-i-put-a-variable).

=== "Two dictionaries, same name"

    When there are two dictionaries defined with the same name
    (e.g. one in a defaults file, another by the user),
    they are not combined.
    Instead, it's all or nothing, one automatically takes precedence.

    <div class="grid" style="grid-template-columns:repeat(auto-fit,minmax(10rem,1fr));" markdown>

    ```yaml { title="Defaults dict" .no-copy }
    test:
      stuff:
        one: "1"
        two: "2"
    ```

    ```yaml { title="Inventory dict" .no-copy }
    test:
      stuff:
        two: "222"
    ```

    ```yaml { title="Resulting dict" .no-copy }
    test:
      stuff:
        two: "222"
    ```

    </div>

=== "Two dictionaries, different names, manually combined"

    Uniquely named dictionaries ensures neither is overwritten.
    Both can be manually combined to create a new merged dictionary.
    The preference is for the inventory dictionary to take precedence.

    <div class="grid" style="grid-template-columns:repeat(auto-fit,minmax(10rem,1fr));" markdown>

    ```yaml { title="Defaults dict" .no-copy }
    test_defaults:
      stuff:
        one: "1"
        two: "2"
    ```

    ```yaml { title="Inventory dict" .no-copy }
    test:
      stuff:
        two: "222"
    ```

    ```yaml { title="Combined dict" .no-copy }
    test_new:
      stuff:
        one: "1"
        two: "222"
    ```

    </div>

As such, the dictionary variable defined for a stack in the defaults file **must** be appended with the phrase `_defaults`.
This allows for a dictionary defined by the user, and the dictionary in the defaults file to be combined by the Ansible playbook.

The resulting variable of the combined dictionaries is named `stack_vars`.

!!! example

    Simplified depiction of how this is done inside the playbook:

    ```py { .no-copy }
    stack_vars = example_group_foobar_stack_defaults | combine(example_group_foobar_stack)
    ```

    The defaults dictionary is combined with the user's dictionary (the latter takes precedence).
