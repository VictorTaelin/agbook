#!/usr/bin/env bash

# Ensure the script exits if any command fails
set -e

SEARCH_PATH="${1:-./Base}"
OK_OUTPUT=$'Checked.'

find "${SEARCH_PATH}" -name "*.agda" -not -path "*.tmp*" -not -path "*/Test/*" | while read -r file; do
    output=$(agda-cli check "${file}" 2>&1)

    if [ "${output}" = "${OK_OUTPUT}" ]; then
        echo "Checked ${file}: OK"
    else
        echo -e "\033[31mChecking: ${file} ERR\033[0m"
        echo "${output}"
    fi
done
