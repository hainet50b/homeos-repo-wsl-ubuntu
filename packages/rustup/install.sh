#!/usr/bin/env sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
grep -q '.cargo/env' "$HOME/.bashrc" || printf '\n. "$HOME/.cargo/env"\n' >> "$HOME/.bashrc"
