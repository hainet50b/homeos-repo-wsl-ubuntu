#!/usr/bin/env sh
set -eu
for agent in $(printf '%s' 'universal,claude-code' | tr ',' ' '); do
    gh skill install hainet50b/plain-language plain-language --agent "$agent" --scope user --force
done
