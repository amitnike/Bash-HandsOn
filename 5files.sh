#!/bin/bash

echo "Enter a filename:"
read FILENAME

echo "Enter some text to write to the file:"
read CONTENT

# imp to note that we need to have content and filename in double quotes
echo "$CONTENT" > "$FILENAME"

echo "Content is now written your file ${FILENAME}"
