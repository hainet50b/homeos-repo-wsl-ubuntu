# homeos-plugin-aws-agent-toolkit

![License](https://img.shields.io/badge/license-MIT%20OR%20Apache--2.0-blue)

A [homeos](https://github.com/homeos-dev/homeos) plugin for the agent skills of the
[Agent Toolkit for AWS](https://docs.aws.amazon.com/agent-toolkit/latest/userguide/what-is-agent-toolkit.html),
backed by the [AWS CLI](https://docs.aws.amazon.com/agent-toolkit/latest/userguide/aws-cli.html)'s
`aws agent-toolkit` commands.

An agent skill is a directory of instructions an AI coding agent loads on demand. This plugin
manages the AWS skills the same way homeos manages software: declared in `homeos.yml`, reproduced
on every machine from the same definition.

## Usage

Add the plugin to your homeos repository:

```sh
homeos plugin add aws-agent-toolkit
```

Create a package using this plugin:

```sh
homeos package add aws-iam --plugin aws-agent-toolkit \
  --param skill=aws-iam --param agents=universal
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
homeos package add aws-iam --plugin aws-agent-toolkit \
  --param skill=aws-iam --param agents=universal,claude-code
```

## Requirements

These scripts call `aws`, so [AWS CLI version 2.35 or later](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
must already be installed. No AWS credentials are needed: the skill catalog is public.

If you manage the AWS CLI itself with homeos — say as a package named `awscli` — point this
package at it with `--depends-on awscli`, so homeos installs the CLI before the skill that needs
it:

```sh
homeos package add aws-iam --plugin aws-agent-toolkit --depends-on awscli \
  --param skill=aws-iam --param agents=universal
```

## Parameters

| Parameter | Description |
|-----------|-------------|
| `skill` | Skill name as listed by `aws agent-toolkit list-available-skills --region us-east-1` (e.g. `aws-iam`) |
| `agents` | Agents the skill should reach, comma-separated (e.g. `universal,claude-code`) — see `aws agent-toolkit add-skill help` for the accepted names |

Use `aws agent-toolkit search-skills --search-query <query> --region us-east-1` to find skills and
the names to pass here.

## Actions

| Action | Command |
|--------|---------|
| install | `aws agent-toolkit add-skill --skill-name {{skill}} --agent <agent> --region us-east-1 --no-sign-request`, once per agent in `{{agents}}` |
| update | `aws agent-toolkit update-skill ...`, once per agent |
| uninstall | `aws agent-toolkit remove-skill ...`, once per agent |

The Agent Toolkit catalog is served only from the `us-east-1` Region, so every command passes
`--region us-east-1` regardless of your default Region. `--no-sign-request` skips credential
lookup, so the actions work whether or not you are signed in to AWS.

## License

Licensed under either of

 * Apache License, Version 2.0 ([LICENSE-APACHE](LICENSE-APACHE) or <http://www.apache.org/licenses/LICENSE-2.0>)
 * MIT license ([LICENSE-MIT](LICENSE-MIT) or <http://opensource.org/licenses/MIT>)

at your option.

## Contribution

Unless you explicitly state otherwise, any contribution intentionally submitted for inclusion in the work by you, as defined in the Apache-2.0 license, shall be dual licensed as above, without any additional terms or conditions.
