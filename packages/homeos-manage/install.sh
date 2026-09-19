#!/usr/bin/env sh
set -eu
for agent in $(printf '%s' 'universal,claude-code' | tr ',' ' '); do
    gh skill install hainet50b/homeos homeos-manage --agent "$agent" --scope user --force
done
