#!/bin/bash
set -eu

count=$(git rev-list --all --count)
branch=$(git show-ref | grep $(git log --pretty=%h -1) | sed 's|.*/\(.*\)|\1|' | sort -u | grep -v HEAD)
hash=$(git rev-parse --short HEAD)

branchName="${CI_COMMIT_REF_SLUG:-${branch/\//-}}"
gitVersion="${count}-${hash}-${branchName}"

echo "versionName=${gitVersion}"
echo "branchName=${branchName}"
echo "versionHash=${hash}"