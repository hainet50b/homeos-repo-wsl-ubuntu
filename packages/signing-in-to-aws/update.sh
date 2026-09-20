#!/usr/bin/env sh
set -eu
for agent in $(printf '%s' 'universal,claude-code' | tr ',' ' '); do
    aws agent-toolkit update-skill --skill-name signing-in-to-aws --agent "$agent" --region us-east-1 --no-sign-request
done
