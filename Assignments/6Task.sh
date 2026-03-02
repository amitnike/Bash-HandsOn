#!/bin/bash

#Write a script that monitors a specific file for changes. If the file modification time changes, 
#the script displays a message indicating the file has been modified. Use the stat command for comparisons.

read -p "Enter the file path to monitor (or type 'exit' to quit): " FILE_PATH

if [ "$FILE_PATH" == "exit" ]; then
        echo "Exiting the script."
        exit 0
fi

#Get modification time of the file in seconds since epoch
LAST_MODIFY_TIME=$(stat -c %Y "$FILE_PATH")
#print the last modification time in human-readable format
echo "The file is being monitored for changes. Last modification time:" $(date -d @$LAST_MODIFY_TIME "+%Y-%m-%d %H:%M:%S")

#Check if the file exists before monitoring
if [ -f "$FILE_PATH" ]; then
    while true; do
        #Get the current modification time of the file in seconds since epoch
        CURRENT_MODIFY_TIME=$(stat -c %Y "$FILE_PATH")
        #do comparison between the last modification time and the current modification time
        if [ "$CURRENT_MODIFY_TIME" -ne "$LAST_MODIFY_TIME" ]; then
            #if miodification time has changed, print the message with the new modification time in human-readable format
            echo "The file has been modified." $(date -d @$CURRENT_MODIFY_TIME "+%Y-%m-%d %H:%M:%S")
            #set the last modification time to the current modification time for the next comparison
            LAST_MODIFY_TIME=$CURRENT_MODIFY_TIME
        fi
        #sleep for 5 seconds before checking again
        sleep 5
    done
else
    echo "File not found. Please enter a valid file path."
fi
