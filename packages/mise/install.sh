#!/usr/bin/env sh
set -e
curl -fsSL https://mise.run | sh
grep -q 'mise activate bash' "$HOME/.bashrc" || printf '\neval "$(%s/.local/bin/mise activate bash)"\n' "$HOME" >> "$HOME/.bashrc"
