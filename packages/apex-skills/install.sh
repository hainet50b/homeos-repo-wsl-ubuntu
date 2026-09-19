#!/usr/bin/env sh
set -e
npx -y apex-skills --claude-only
# The npx installer links skills and /apex commands but not the steering hub the commands read.
ln -sfn "$HOME/.apex-skills/steering" "$HOME/.claude/apex-steering"
