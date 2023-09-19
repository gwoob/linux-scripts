#!/bin/sh

# Check if a file path is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <file>"
    exit 1
fi

file="$1"

# Check if the file requires superuser access
if [ -w "$file" ]; then
    # The file is writable by the current user, so we can use the default editor
    $EDITOR "$file"
else
    # The file requires superuser access, use sudoedit to securely edit it
    sudoedit "$file"
fi
