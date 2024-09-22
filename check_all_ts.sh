#!/bin/bash

for file in $(find . -name "*.ts" -not -path "./node_modules/*" -not -path "./Test/*"); do
  echo "Checking $file..."
  if ! tsc --noEmit --target esnext --skipLibCheck "$file"; then
    echo "Removing $file..."
    rm "$file"
  fi
done

