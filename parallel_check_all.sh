#!/bin/bash

# Ensure the script exits if any command fails
set -e

OK_OUTPUT=$'Checked.'

# Function to check a single Agda file
check_file() {
    file="$1"
    output=$(agda-cli check "$file" 2>&1)
    if [ "$output" = "$OK_OUTPUT" ]; then
        echo "Checked $file: OK"
    else
        echo -e "\033[31mChecking: $file ERR\033[0m"
        echo "$output"
    fi
}
export -f check_file
export OK_OUTPUT

# Main script
main() {
    search_path="${1:-./Base}"

    # Check if GNU Parallel is installed
    if ! command -v parallel &> /dev/null; then
        echo "GNU Parallel is not installed. Please install it to run checks in parallel."
        exit 1
    fi

    # Run Agda checks in parallel
    find "$search_path" -name "*.agda" -not -path "*.tmp*" -not -path "*/Test/*" -print0 | \
        parallel -0 -j+0 check_file

    echo "All Agda checks passed successfully."
}

# Run the main function
main "$@"
