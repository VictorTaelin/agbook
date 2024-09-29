#!/usr/bin/env bash

for file in $(find . -name "*.kind" -not -path "./node_modules/*" -not -path "./Test/*"); do
  echo "Checking $file..."
  if ! kind check "$file"; then
    echo "Removing $file"
    rm "$file"
  fi
done

