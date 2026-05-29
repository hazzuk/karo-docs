# --8<-- [start:git_clone]
```sh
# set github username
GIT_USERNAME=username
```

```sh
# clone karo-stack fork
git clone -b main git@github.com:${GIT_USERNAME}/karo-stack.git /srv/karo
```

```sh
# clone karo-inventory
git clone git@github.com:${GIT_USERNAME}/karo-inventory.git /srv/karo/inventory
```
# --8<-- [end:git_clone]

# --8<-- [start:terminal_paste]
!!! tip "Terminal paste"

    Use ++ctrl+shift+v++ to paste your clipboard when using the terminal.
# --8<-- [end:terminal_paste]
