# homeos-plugin-mise

![License](https://img.shields.io/badge/license-MIT%20OR%20Apache--2.0-blue)

A [homeos](https://github.com/homeos-dev/homeos) plugin for [mise](https://github.com/jdx/mise), the polyglot tool version manager.

## Usage

Add the plugin to your homeos repository:

```sh
homeos plugin add mise
```

Create a package using this plugin:

```sh
homeos package add java-temurin25 --plugin mise --param tool=java@temurin-25
homeos package add ripgrep --plugin mise --param tool=cargo:ripgrep@latest
```

The homeos package name is a human-friendly slug you choose (e.g. `java-temurin25`); the full mise tool spec — including characters like `@` and `:` — goes in the `tool` parameter.

These scripts call `mise`, so it must already be installed. Whether you manage mise itself with homeos is up to you; if you do, add `--depends-on mise` so homeos installs it before these tools.

## Parameters

| Parameter | Description |
|-----------|-------------|
| `tool` | Full mise tool spec (e.g. `java@temurin-25`, `cargo:ripgrep@latest`) |

## Actions

| Action | Command |
|--------|---------|
| install | `mise use -g -y "{{tool}}"` |
| update | `mise upgrade -y "{{tool}}"` |
| uninstall | `mise unuse -g -y "{{tool}}"` |

## License

Licensed under either of

 * Apache License, Version 2.0 ([LICENSE-APACHE](LICENSE-APACHE) or <http://www.apache.org/licenses/LICENSE-2.0>)
 * MIT license ([LICENSE-MIT](LICENSE-MIT) or <http://opensource.org/licenses/MIT>)

at your option.

## Contribution

Unless you explicitly state otherwise, any contribution intentionally submitted for inclusion in the work by you, as defined in the Apache-2.0 license, shall be dual licensed as above, without any additional terms or conditions.
