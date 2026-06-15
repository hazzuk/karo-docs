<!-- use snippets with `--8<-- "snippets.md:name"` -->

<!-- commands -->

# --8<-- [start:pipx_install]
```sh
# install packages
pipx install --include-deps ansible rust-just
```
# --8<-- [end:pipx_install]

# --8<-- [start:git_clone]
```sh
# set github username variable
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

# --8<-- [start:arr_auth]
As the app [doesn't support OIDC](https://wiki.servarr.com/en/radarr/faq#authentication-method), we use forward authentication instead. But to prevent needing to double authenticate, you should configure authentication as `External`.

1. Setup authentication as standard on your first visit

    - Authentication method: `Forms (Login page)`
    - Authentication required: `Enabled`
    - Username: `karo`
    - Password: `forgetthispassword`

1. Down the stack

1. Run the following as karo, substituting the word 'Forms' with 'External' in the app's config file.
# --8<-- [end:arr_auth]
