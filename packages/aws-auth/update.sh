#!/usr/bin/env sh
set -eu
for agent in $(printf '%s' 'universal,claude-code' | tr ',' ' '); do
    gh skill install aws/agent-toolkit-for-aws core-skills/aws-auth --agent "$agent" --scope user --force
done
