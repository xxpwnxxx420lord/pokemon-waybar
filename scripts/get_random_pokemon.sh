#!/bin/bash
DIR="$HOME/.local/share/pokemon-icat/pokemon-icons/shiny"

# Check if the directory exists
if [ -d "$DIR" ]; then
    # Find all .png files in the directory and pick a random one
    # Using 'find' to get files and 'shuf' to randomize
    FILE=$(find "$DIR" -maxdepth 1 -name "*.png" | shuf -n 1)

    if [ -n "$FILE" ]; then
        # Output the path of the file
        echo "$FILE"
    else
        echo "Error: no PNG files found in $DIR" >&2
        exit 1
    fi
else
    echo "Error: Directory $DIR does not exist." >&2
    exit 1
fi
