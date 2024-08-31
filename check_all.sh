#!/bin/bash

find . -name "*.agda" -not -path "*.tmp*" | while read -r file; do
    echo "Checking: $file"
    agda-cli check "$file"
    echo ""
done

