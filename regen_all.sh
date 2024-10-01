#!/usr/bin/env bash

# This script regenerates "ALL.agda" files.

# Ensure script exits if any command fails.
set -e

SEARCH_PATH="${1:-Base}"

# For each first-level directory:
find -s "${SEARCH_PATH}" -depth 1 -type d |
  while read -r dir
do
  # Replace slashes with periods in directory path to obtain directory's fully-qualified module name.
  dir_mod="${dir////.}"

  # Start regenerating directory's "ALL.agda".
  echo -e "module ${dir_mod}.ALL where\n" > "${dir}/ALL.agda"

  # For each "*.agda" file that isn't "ALL.agda" or temporary, and isn't located in "Examples" or "Test":
  # FIXME: Temporarily skipping "Omega" as well.
  find -s "${dir}" -type f \
      -name "*.agda" \
      -not -name "ALL.agda" \
      -not -path "*.tmp*" \
      -not -path "*/Examples/*" \
      -not -path "*/Omega/*" \
      -not -path "*/Test/*" \
      -not -path "*-.agda" | # remove tests
    while read -r file
  do
    # Remove extension from file path.
    file_base="${file%%.agda}"

    # Replace slashes with periods in file path to obtain file's fully-qualified module name.
    file_mod="${file_base////.}"

    # Add file to directory's "ALL.agda".
    echo "open import ${file_mod} public" >> "${dir}/ALL.agda"
  done
done
