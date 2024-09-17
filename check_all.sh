#!/bin/bash

find $1 -name "*.agda" -not -path "*.tmp*" | while read -r file; do
    echo "Checking: $file"
    agda-cli check "$file"
    echo ""
done
