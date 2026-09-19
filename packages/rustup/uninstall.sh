#!/usr/bin/env sh
"$HOME/.cargo/bin/rustup" self uninstall -y
sed -i '/\.cargo\/env/d' "$HOME/.bashrc"
