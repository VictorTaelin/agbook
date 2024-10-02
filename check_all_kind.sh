#!/usr/bin/env bash

# Checks all Kind files and outputs checks normally.
SEARCH_PATH="${1:-./Base}"

check_file() {
    file="$1"
    kind check "${file}"
}

main() {
    while IFS= read -r -d '' file; do
        check_file "${file}"
    done < <(find "${SEARCH_PATH}" -name "*.kind" -not -path "*/Test/*" -print0)
    echo "All Kind checks completed."
}

main "$@"