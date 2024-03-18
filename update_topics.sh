#!/bin/bash

# Function to check if a given text exists in a file
text_exists() {
    local text="$1"
    local file="$2"
    grep -qF "$text" "$file"
}

# Function to append new text to a file
append_text() {
    local text="$1"
    local file="$2"
    if text_exists "$text" "$file"; then
        echo "Text already exists in the file. Ignored."
    else
        if [ -s "$file" ]; then
            echo -n ",$text" >> "$file"
        else
            echo -n "$text" >> "$file"
        fi
        echo "Text added to file."
    fi
}

# Usage: ./update_file.sh "new_text" "file.txt"

if [ $# -ne 2 ]; then
    echo "Usage: $0 \"new_text\" \"file.txt\""
    exit 1
fi

new_text="$1"
file="$2"

append_text "$new_text" "$file"
