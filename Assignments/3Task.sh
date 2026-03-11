
#!/bin/bash

# Interactive File Size Check Script
# This script prompts the user for a file path and displays the file size.
# If the file exists, it keeps checking the size every 10 seconds in real-time.
# If the user types 'exit', the script will quit.

# Prompt the user to enter a file path (or 'exit' to quit)
read -p "Enter a file path (or type 'exit' to quit): " FILE_PATH

# If the user types 'exit', stop the script gracefully
if [ "$FILE_PATH" == "exit" ]; then
        echo "Exiting the script."
        exit 0
fi

# Check if the entered path is a valid file
if [ -f "$FILE_PATH" ]; then
    # If the file exists, start an infinite loop to monitor its size
    while true; do
        # Use 'du -sh' to get the human-readable file size (e.g., KB, MB, GB)
        # 'cut -f1' extracts only the size value, ignoring the filename
        FILE_SIZE=$(du -sh "$FILE_PATH" | cut -f1)

        # Display the file size to the user
        echo "File size: $FILE_SIZE"

        # Wait for 10 seconds before checking again
        sleep 10
    done
else
        # If the file does not exist, show an error message
        echo "File not found. Please enter a valid file path."
fi
