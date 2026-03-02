#!/bin/bash

#Write a script that checks the free disk space on a specific partition  (e.g., /) and 
#displays the available space in megabytes (MB) or gigabytes (GB). 
#Update the information periodically (e.g., every minute) using a loop.

get_disk_usage() {
    MOUNT=$1
    clear
    echo "Disk Usage for $MOUNT partition:"
    #get the available space in human-readable format and display it
    #NR==2 is used to print the second line of the output, which contains info about the parition
    #$4 is used to print the fourth column of the output, which contains the available space
    df -h $MOUNT | awk 'NR==2 {print "Available Space: " $4}'
}


# Main loop to update system information every minute
while true; do
    get_disk_usage /  # Change this to the desired partition (e.g., / for root)
    sleep 60  # Update every 60 seconds (1 minute)
done