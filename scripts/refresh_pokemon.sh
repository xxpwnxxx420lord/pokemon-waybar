#!/bin/bash
DIR="$HOME/.local/share/pokemon-icat/pokemon-icons/shiny"
TARGET="/tmp/current_pokemon.png"

# Wait until the directory is actually readable
until [ -d "$DIR" ]; do
    sleep 1
done

# Pick a random file and copy it
FILE=$(find "$DIR" -maxdepth 1 -name "*.png" | shuf -n 1)
if [ -n "$FILE" ]; then
    cp "$FILE" "$TARGET"
else
    echo "Error: no PNG files found in $DIR" >&2
    exit 1
fi
