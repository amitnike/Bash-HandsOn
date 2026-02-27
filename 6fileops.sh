#!/bin/bash

# Get a filename from the user
echo "Enter the filename you want to work with:"
read FILENAME

# Ask the user if they want to write, append, or read
echo "Do you want to (w)rite, (a)ppend, or (r)ead the file?"
read ACTION

if [ "$ACTION" == "w" ]; then
    echo "Enter some text to write to the file (this will overwrite existing content):"
    read CONTENT
    echo "$CONTENT" > "$FILENAME"
    echo "Content has been written to $FILENAME"
elif [ "$ACTION" == "a" ]; then
    echo "Enter some text to append to the file:"
    read CONTENT
    echo "$CONTENT" >> "$FILENAME"
    echo "Content has been appended to $FILENAME"
elif [ "$ACTION" == "r" ]; then
    echo "--- Contents of $FILENAME ---"
    cat "$FILENAME"
    echo "---------------------------"
else
    echo "Invalid option selected."
fi

