#!/usr/bin/env sh
"$HOME/.local/bin/mise" implode -y
sed -i '/mise activate bash/d' "$HOME/.bashrc"
