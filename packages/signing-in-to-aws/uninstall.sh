#!/usr/bin/env sh
set -eu
for agent in $(printf '%s' 'universal,claude-code' | tr ',' ' '); do
    gh skill list --agent "$agent" --scope user --json skillName,path --jq '.[] | select(.skillName == "core-skills/signing-in-to-aws") | .path' \
        | while IFS= read -r path; do rm -rf "$path"; done
done
