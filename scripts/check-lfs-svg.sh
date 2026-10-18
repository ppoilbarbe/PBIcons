#!/usr/bin/env bash
# Fail if a staged .svg file is larger than $THRESHOLD_KB but not tracked by Git LFS.
set -euo pipefail

THRESHOLD_KB=100
status=0

for file in "$@"; do
    size_kb=$(( $(stat -c%s -- "$file") / 1024 ))
    if [ "$size_kb" -gt "$THRESHOLD_KB" ]; then
        filter=$(git check-attr filter -- "$file" | sed 's/^.*: filter: //')
        if [ "$filter" != "lfs" ]; then
            echo "error: $file is ${size_kb}KB (> ${THRESHOLD_KB}KB) but is not tracked by Git LFS." >&2
            echo "  Add it to .gitattributes, e.g.:" >&2
            echo "    echo '$file filter=lfs diff=lfs merge=lfs -text' >> .gitattributes" >&2
            status=1
        fi
    fi
done

exit "$status"
