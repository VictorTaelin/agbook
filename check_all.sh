#!/bin/bash

# First argument or '.' if nothing is passed
search_path=${1:-.}

find "$search_path" -name "*.agda" -not -path "*.tmp*" | while read -r file; do
    echo "Checking: $file"
    agda-cli check "$file"
    echo ""
done
