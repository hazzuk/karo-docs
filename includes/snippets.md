<!-- commands -->

# --8<-- [start:pipx_install]
```sh
# install packages
pipx install --include-deps ansible rust-just
```
# --8<-- [end:pipx_install]

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

# --8<-- [start:just_password]
```sh
# set vault password
cd /srv/karo
just password
```
# --8<-- [end:just_password]

<!-- admonitions -->

# --8<-- [start:terminal_paste]
!!! tip "Terminal paste"

    Use ++ctrl+shift+v++ to paste your clipboard when using the terminal.
# --8<-- [end:terminal_paste]

<!-- text -->

# --8<-- [start:cloudflare_token]
1. Visit [dash.cloudflare.com/profile/api-tokens](https://dash.cloudflare.com/profile/api-tokens)

1. Select 'Create Token' > 'Create Custom Token'
# --8<-- [end:cloudflare_token]
