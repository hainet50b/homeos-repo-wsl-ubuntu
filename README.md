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
| [awscli](packages/awscli/) | [mise](plugins/mise/) | [mise](packages/mise/) | AWS CLI v2 for working with AWS accounts. |
| [bat](packages/bat/) | [mise](plugins/mise/) | [mise](packages/mise/) | `cat` clone with syntax highlighting and Git integration. |
| [chezmoi](packages/chezmoi/) | [mise](plugins/mise/) | [mise](packages/mise/) | Manage your dotfiles across multiple machines. |
| [claude-code](packages/claude-code/) | — | — | Anthropic's agentic coding tool for the terminal. |
| [codex-cli](packages/codex-cli/) | — | — | OpenAI's agentic coding CLI for the terminal. |
| [delta](packages/delta/) | [apt](plugins/apt/) | — | Syntax-highlighting pager for `git diff` and `grep`. |
| [eza](packages/eza/) | [apt](plugins/apt/) | — | Modern `ls` replacement with colors, icons, and Git status. |
| [fd](packages/fd/) | [mise](plugins/mise/) | [mise](packages/mise/) | Fast, user-friendly `find` replacement. |
| [fzf](packages/fzf/) | [apt](plugins/apt/) | — | Command-line fuzzy finder. |
| [gh](packages/gh/) | [mise](plugins/mise/) | [mise](packages/mise/) | GitHub CLI for repositories, pull requests, and agent skills. |
| [git-filter-repo](packages/git-filter-repo/) | [apt](plugins/apt/) | — | Rewrites Git history; replaces `git filter-branch`. |
| [gradle](packages/gradle/) | [mise](plugins/mise/) | [mise](packages/mise/) | Gradle 9 build tool. |
| [helm](packages/helm/) | [mise](plugins/mise/) | [mise](packages/mise/) | Kubernetes package manager (Helm 4). |
| [homeos](packages/homeos/) | — | — | homeos itself (self-managed via the official install script). |
| [jdk-temurin-25](packages/jdk-temurin-25/) | [mise](plugins/mise/) | [mise](packages/mise/) | Eclipse Temurin 25 (LTS) JDK. |
| [jq](packages/jq/) | [apt](plugins/apt/) | — | Command-line JSON processor. |
| [k9s](packages/k9s/) | [mise](plugins/mise/) | [mise](packages/mise/) | Terminal UI for Kubernetes clusters. |
| [kubectl](packages/kubectl/) | [mise](plugins/mise/) | [mise](packages/mise/) | Kubernetes command-line client (1.37). |
| [lazydocker](packages/lazydocker/) | [mise](plugins/mise/) | [mise](packages/mise/) | Terminal UI for Docker and docker-compose. |
| [lazygit](packages/lazygit/) | [apt](plugins/apt/) | — | Terminal UI for Git commands. |
| [make](packages/make/) | [apt](plugins/apt/) | — | GNU Make build tool. |
| [maven](packages/maven/) | [mise](plugins/mise/) | [mise](packages/mise/) | Apache Maven 3 build tool. |
| [mise](packages/mise/) | — | — | Polyglot tool version manager, activated in `.bashrc`. |
| [neovim](packages/neovim/) | [apt](plugins/apt/) | — | Primary text editor. |
| [node](packages/node/) | [mise](plugins/mise/) | [mise](packages/mise/) | Node.js 22 runtime. |
| [ripgrep](packages/ripgrep/) | [apt](plugins/apt/) | — | Fast recursive search (`rg`); `grep` replacement. |
| [rustup](packages/rustup/) | — | — | Rust toolchain installer and version manager (provides rustc and cargo). |
| [shellcheck](packages/shellcheck/) | [apt](plugins/apt/) | — | Static analysis linter for shell scripts. |
| [shfmt](packages/shfmt/) | [apt](plugins/apt/) | — | Shell script formatter. |
| [starship](packages/starship/) | [apt](plugins/apt/) | — | Fast, customizable cross-shell prompt. |
| [terraform](packages/terraform/) | [mise](plugins/mise/) | [mise](packages/mise/) | Infrastructure-as-code CLI (Terraform 1.16). |
| [unzip](packages/unzip/) | [apt](plugins/apt/) | — | Archive extraction utility for `.zip` files. |
| [uv](packages/uv/) | [mise](plugins/mise/) | [mise](packages/mise/) | Fast Python package and project manager. |
| [yazi](packages/yazi/) | [mise](plugins/mise/) | [mise](packages/mise/) | Blazing-fast terminal file manager. |
| [zoxide](packages/zoxide/) | [apt](plugins/apt/) | — | Smarter `cd` that learns your most-used directories. |

## Skills

| Skill | Plugin | Dependencies | Purpose |
|---|---|---|---|
| [apex-skills](packages/apex-skills/) | — | [node](packages/node/) | Apex agent skills and `/apex` commands for Claude Code, from the `apex-skills` npm installer. |
| [aws-billing-and-cost-management](packages/aws-billing-and-cost-management/) | [gh-skill](plugins/gh-skill/) | [gh](packages/gh/) | AWS Budgets, Cost Explorer, pricing and Free Tier guidance, from the Agent Toolkit for AWS. |
| [aws-iam](packages/aws-iam/) | [gh-skill](plugins/gh-skill/) | [gh](packages/gh/) | IAM roles, policies, STS and Identity Center pitfalls and workflows, from the Agent Toolkit for AWS. |
| [hainet50b-skills](packages/hainet50b-skills/) | — | [gh](packages/gh/) | Every agent skill published in [hainet50b/skills](https://github.com/hainet50b/skills), synced for the universal and Claude Code agents. |
| [homeos-inventory](packages/homeos-inventory/) | [gh-skill](plugins/gh-skill/) | [gh](packages/gh/) | Tells AI agents which tools and applications homeos has installed. |
| [homeos-manage](packages/homeos-manage/) | [gh-skill](plugins/gh-skill/) | [gh](packages/gh/) | Teaches AI agents to install, update, and uninstall software through homeos. |
| [plain-language](packages/plain-language/) | [gh-skill](plugins/gh-skill/) | [gh](packages/gh/) | Applies plain-language principles to the prose an agent writes, edits, reviews, or translates. |
| [signing-in-to-aws](packages/signing-in-to-aws/) | [gh-skill](plugins/gh-skill/) | [gh](packages/gh/) | Signing in to AWS with IAM Identity Center, profiles and credentials, from the Agent Toolkit for AWS. |
| [utsusemi-harness](packages/utsusemi-harness/) | [gh-skill](plugins/gh-skill/) | [gh](packages/gh/) | Utsusemi spec-driven development harness skill. |

## Plugins

| Plugin | Source | Description |
|---|---|---|
| [apt](plugins/apt/) | [homeos-dev/homeos-plugin-apt](https://github.com/homeos-dev/homeos-plugin-apt) | APT package manager plugin for homeos. |
| [gh-skill](plugins/gh-skill/) | [homeos-dev/homeos-plugin-gh-skill](https://github.com/homeos-dev/homeos-plugin-gh-skill) | Agent skill plugin for homeos, backed by GitHub CLI (gh skill, preview). |
| [mise](plugins/mise/) | [homeos-dev/homeos-plugin-mise](https://github.com/homeos-dev/homeos-plugin-mise) | mise tool version manager plugin for homeos. |

## Notes

(free-form section for your own notes — homeos and the agent never modify it.)

---

*Managed by [homeos](https://github.com/homeos-dev/homeos).*
