#!/usr/bin/env sh
set -eu
for agent in $(printf '%s' 'universal,claude-code' | tr ',' ' '); do
    gh skill install utsusemi-harness/utsusemi-harness utsusemi-harness --agent "$agent" --scope user --force
done
