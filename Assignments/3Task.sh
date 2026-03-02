#!/bin/bash

# Interactive File Size Check: Write a script that prompts the user for a file path 
#and Displays the file size in real-time as the user types (using backspace for corrections). Employ the read command and the du -s command to check size.

read -p "Enter a file path (or type 'exit' to quit): " FILE_PATH

if [ "$FILE_PATH" == "exit" ]; then
        echo "Exiting the script."
        exit 0
fi

    
if [ -f "$FILE_PATH" ]; then
    while true; do
        FILE_SIZE=$(du -sh "$FILE_PATH" | cut -f1)
        echo "File size: $FILE_SIZE"
        sleep 10
    done
else
        echo "File not found. Please enter a valid file path."
fi
