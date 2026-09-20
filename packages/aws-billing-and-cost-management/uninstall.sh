#!/usr/bin/env sh
set -eu
for agent in $(printf '%s' 'universal,claude-code' | tr ',' ' '); do
    aws agent-toolkit remove-skill --skill-name aws-billing-and-cost-management --agent "$agent" --region us-east-1 --no-sign-request
done
