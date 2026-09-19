#!/usr/bin/env sh
set -e
npx -y apex-skills --update
ln -sfn "$HOME/.apex-skills/steering" "$HOME/.claude/apex-steering"
