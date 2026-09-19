#!/usr/bin/env sh
# Remove every user-scope skill that was installed from hainet50b/skills.
# Skills from other sources, and skills placed by hand, are left alone.
set -eu

SOURCE_URL='https://github.com/hainet50b/skills'
AGENTS='universal claude-code'

for agent in $AGENTS; do
    gh skill list --agent "$agent" --scope user --json skillName,path,sourceURL \
        --jq ".[] | select(.sourceURL == \"$SOURCE_URL\") | [.skillName, .path] | @tsv" \
    | while IFS="$(printf '\t')" read -r name path; do
        echo "Removing skill '$name' ($agent): $path"
        rm -rf -- "$path"
    done
done
