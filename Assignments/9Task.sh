#!/bin/bash

# Disk Space Monitor Script
# This script checks the free disk space on a specific partition (e.g., /)
# and displays the available space in MB or GB.
# It updates the information every minute using a loop.

# Function to get disk usage for a given partition
get_disk_usage() {
    MOUNT=$1   # Store the partition path (e.g., /, /home, /var)

    clear      # Clear the terminal screen for a clean display

    echo "Disk Usage for $MOUNT partition:"

    # Use 'df -h' to display disk usage in human-readable format (MB/GB)
    # 'NR==2' ensures we only print the second line of the output (the partition info)
    # '$4' extracts the fourth column, which contains the available space
    df -h $MOUNT | awk 'NR==2 {print "Available Space: " $4}'
}

# Main loop to update disk usage every minute
while true; do
    get_disk_usage /   # Call the function for the root partition (/)
    sleep 60           # Wait for 60 seconds before refreshing
done