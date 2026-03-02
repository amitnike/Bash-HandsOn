#!/bin/bash

FILE_NAME="Document.txt"

if [ -f "$FILE_NAME" ]; then
    echo "File $FILE_NAME exists."
else
    echo "File $FILE_NAME does not exist."
fi