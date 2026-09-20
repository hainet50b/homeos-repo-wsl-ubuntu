#!/usr/bin/env sh
set -eu
for agent in $(printf '%s' 'universal,claude-code' | tr ',' ' '); do
    aws agent-toolkit add-skill --skill-name aws-iam --agent "$agent" --region us-east-1 --no-sign-request
done
