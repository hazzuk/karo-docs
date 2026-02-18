---
icon: lucide/pencil-ruler
---

# Contributing

A full guide for new contributions will come later. For now, this section contains important notes for existing maintainers.

## Documentation

### Icons

#### Generic

The docs primarily uses `lucide`.  
Zensical also provides other [icon sources](https://zensical.org/docs/authoring/icons-emojis/):

- `fontawesome` (/brands /regular /solid)
- `material`
- `octicons`
- `simple`

#### Custom

For [custom icons](https://zensical.org/docs/setup/logo-and-icons/#additional-icons) (i.e. Stacks), the docs uses the `./overrides/.icons/` directory.  
This contains **dark** `svg` icons sourced from:

- [selfh.st/icons](https://selfh.st/icons/)
- [dashboardicons.com/icons](https://dashboardicons.com/icons)

New files need to be manually edited to include the following attribute:

(Added after the `xmlns` attribute)

```c
fill="currentColor"
```

This ensures icons work in both light and dark modes.
