#!/bin/bash

search_path="./Base"

find "$search_path" -name "*.agda" -not -path "*.tmp*" -not -path "*/Test/*" | while read -r file; do
    result=$(agda-cli check "$file" 2>&1)
    if [ $? -eq 0 ]; then
        echo "Checking: $file OK"
    else
        echo -e "\033[31mChecking: $file ERR\033[0m"
    fi
done

