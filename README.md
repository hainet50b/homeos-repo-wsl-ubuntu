# homeos-repo

This repository is the source of truth for the user's software setup,
managed by [homeos](https://github.com/homeos-dev/homeos). The full
machine-readable definition lives in [`homeos.yml`](homeos.yml); the
sections below are a human-friendly view kept in sync with it.

To restore on any machine:

```sh
homeos init <this repo's URL>
homeos apply
```

## Packages

| Package | Plugin | Dependencies | Purpose |
|---|---|---|---|
| [homeos](packages/homeos/) | — | — | homeos itself (self-managed via the official install script). |

## Skills

| Skill | Plugin | Dependencies | Purpose |
|---|---|---|---|

## Plugins

| Plugin | Source | Description |
|---|---|---|

## Notes

(free-form section for your own notes — homeos and the agent never modify it.)

---

*Managed by [homeos](https://github.com/homeos-dev/homeos).*
