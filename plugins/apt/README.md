# homeos-plugin-apt

![License](https://img.shields.io/badge/license-MIT%20OR%20Apache--2.0-blue)

A [homeos](https://github.com/homeos-dev/homeos) plugin for [APT](https://wiki.debian.org/Apt), the package manager used by Debian, Ubuntu, and related distributions.

## Usage

Add the plugin to your homeos repository:

```sh
homeos plugin add apt
```

Create a package using this plugin:

```sh
homeos package add neovim --plugin apt --param name=neovim
```

## Parameters

| Parameter | Description |
|-----------|-------------|
| `name` | APT package name (e.g., `neovim`, `build-essential`) |

## Actions

| Action | Command |
|--------|---------|
| install | `sudo apt-get update && sudo apt-get -y install {{name}}` |
| update | `sudo apt-get update && sudo apt-get -y install --only-upgrade {{name}}` |
| uninstall | `sudo apt-get -y remove {{name}}` |

## License

Licensed under either of

 * Apache License, Version 2.0
   ([LICENSE-APACHE](LICENSE-APACHE) or <http://www.apache.org/licenses/LICENSE-2.0>)
 * MIT license
   ([LICENSE-MIT](LICENSE-MIT) or <http://opensource.org/licenses/MIT>)

at your option.

## Contribution

Unless you explicitly state otherwise, any contribution intentionally submitted
for inclusion in the work by you, as defined in the Apache-2.0 license, shall be
dual licensed as above, without any additional terms or conditions.
