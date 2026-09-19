#!/usr/bin/env sh
# Sync every skill in hainet50b/skills into each agent's user-scope skill
# directory: install or overwrite what the repository has, then delete the
# skills that came from this repository but no longer exist in it.
set -eu

REPO='hainet50b/skills'
SOURCE_URL='https://github.com/hainet50b/skills'
AGENTS='universal claude-code'

for agent in $AGENTS; do
    gh skill install "$REPO" --all --agent "$agent" --scope user --force

    # Without a skill name, a non-interactive install lists the repository's
    # skills on stdout, one per line: "[<prefix>] <name><TAB><description>".
    in_repo=$(gh skill install "$REPO" --agent "$agent" --scope user 2>/dev/null \
        | cut -f1 | sed 's/^\[[^]]*\][[:space:]]*//' | grep . || true)
    if [ -z "$in_repo" ]; then
        echo "warning: could not list skills in $REPO for agent '$agent'; skipping removal of stale skills." >&2
        continue
    fi

    gh skill list --agent "$agent" --scope user --json skillName,path,sourceURL \
        --jq ".[] | select(.sourceURL == \"$SOURCE_URL\") | [.skillName, .path] | @tsv" \
    | while IFS="$(printf '\t')" read -r name path; do
        if printf '%s\n' "$in_repo" | grep -qxF -- "$name"; then
            continue
        fi
        echo "Removing stale skill '$name' ($agent): $path"
        rm -rf -- "$path"
    done
done
