# homeos-plugin-gh-skill

![License](https://img.shields.io/badge/license-MIT%20OR%20Apache--2.0-blue)

A [homeos](https://github.com/homeos-dev/homeos) plugin for agent skills, backed by
[GitHub CLI](https://cli.github.com/)'s `gh skill`.

An agent skill is a directory of instructions an AI coding agent loads on demand. This plugin
manages skills the same way homeos manages software: declared in `homeos.yml`, reproduced on
every machine from the same definition.

## Usage

Add the plugin to your homeos repository:

```sh
homeos plugin add gh-skill
```

Create a package using this plugin:

```sh
homeos package add frontend-design --plugin gh-skill \
  --param repo=anthropics/skills --param skill=frontend-design --param agents=universal
```

Skills are installed at **user scope** — under your home directory — so they are available
everywhere on the machine.

## Choosing agents

`universal` installs into the shared `~/.agents/skills` directory defined by the
[Agent Skills specification](https://agentskills.io/specification). Start there.

Some agents load skills only from a directory of their own — Claude Code reads
`~/.claude/skills`. To reach one of those as well, add it after `universal`, separated by a
comma (`universal,claude-code`):

```sh
homeos package add frontend-design --plugin gh-skill \
  --param repo=anthropics/skills --param skill=frontend-design --param agents=universal,claude-code
```

## Requirements

These scripts call `gh`, so [GitHub CLI](https://cli.github.com/) must already be installed and
authenticated (`gh auth login`).

If you manage `gh` itself with homeos — say as a package named `gh` — point this package at it
with `--depends-on gh`, so homeos installs `gh` before the skill that needs it:

```sh
homeos package add frontend-design --plugin gh-skill --depends-on gh \
  --param repo=anthropics/skills --param skill=frontend-design --param agents=universal
```

`gh skill` is a preview feature of GitHub CLI and may change without notice.

## Parameters

| Parameter | Description |
|-----------|-------------|
| `repo` | Source repository in `OWNER/REPO` form (e.g. `anthropics/skills`) |
| `skill` | Skill name, as reported by `gh skill list` (e.g. `frontend-design`) |
| `agents` | Agents the skill should reach, comma-separated (e.g. `universal,claude-code`) — see `gh skill install --help` for the accepted names |

Pass the skill **name**, not a path within the repository. `gh skill install` accepts a path, but
uninstall resolves the installed directory by matching the skill name, so a path leaves nothing
for it to remove.

Use `gh skill search <query>` to find skills and the names to pass here.

## Actions

| Action | Command |
|--------|---------|
| install | `gh skill install {{repo}} {{skill}} --agent <agent> --scope user --force`, once per agent in `{{agents}}` |
| update | same as install |
| uninstall | `gh skill list --agent <agent> ... --jq '...'` piped into a directory removal, once per agent in `{{agents}}` |

Install and update run the same command: re-installing fetches the latest version and overwrites
what is there, so the action is idempotent and local edits to an installed skill are lost.

Uninstall is a directory removal because `gh skill` has no uninstall command: it asks `gh skill list`
for the installed path of `{{skill}}` under each agent and scope, then removes it. Nothing is
removed when the skill is not installed.

## License

Licensed under either of

 * Apache License, Version 2.0 ([LICENSE-APACHE](LICENSE-APACHE) or <http://www.apache.org/licenses/LICENSE-2.0>)
 * MIT license ([LICENSE-MIT](LICENSE-MIT) or <http://opensource.org/licenses/MIT>)

at your option.

## Contribution

Unless you explicitly state otherwise, any contribution intentionally submitted for inclusion in the work by you, as defined in the Apache-2.0 license, shall be dual licensed as above, without any additional terms or conditions.
