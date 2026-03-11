#!/bin/bash

# File Change Monitor Script
# This script monitors a specific file for modifications.
# It checks the file’s last modified time in a loop and displays a message
# if the file has been updated since the script started.

# Prompt the user to enter the file path (or 'exit' to quit)
read -p "Enter the file path to monitor (or type 'exit' to quit): " FILE_PATH

# If the user types 'exit', stop the script gracefully
if [ "$FILE_PATH" == "exit" ]; then
        echo "Exiting the script."
        exit 0
fi

# Get the last modification time of the file in seconds since epoch
LAST_MODIFY_TIME=$(stat -c %Y "$FILE_PATH")

# Print the last modification time in human-readable format
echo "The file is being monitored for changes. Last modification time:" \
     $(date -d @$LAST_MODIFY_TIME "+%Y-%m-%d %H:%M:%S")

# Check if the file exists before monitoring
if [ -f "$FILE_PATH" ]; then
    # Start an infinite loop to keep monitoring the file
    while true; do
        # Get the current modification time of the file in seconds since epoch
        CURRENT_MODIFY_TIME=$(stat -c %Y "$FILE_PATH")

        # Compare the last modification time with the current modification time
        if [ "$CURRENT_MODIFY_TIME" -ne "$LAST_MODIFY_TIME" ]; then
            # If modification time has changed, print a message with the new time
            echo "The file has been modified." \
                 $(date -d @$CURRENT_MODIFY_TIME "+%Y-%m-%d %H:%M:%S")

            # Update LAST_MODIFY_TIME to the new value for the next comparison
            LAST_MODIFY_TIME=$CURRENT_MODIFY_TIME
        fi

        # Sleep for 5 seconds before checking again
        sleep 5
    done
else
    # If the file does not exist, show an error message
    echo "File not found. Please enter a valid file path."
fi