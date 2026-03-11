#!/bin/bash

# System Uptime Monitor Script
# This script displays the system uptime and refreshes it every 5 seconds.
# It uses the 'uptime' command inside a loop to provide real-time updates.

# Start an infinite loop
while true; do
    # Clear the terminal screen before each update
    clear

    # Print a header message
    echo "System Uptime:"

    # Run the 'uptime' command, then process its output:
    # - awk splits the output at the word "up" and prints the second part
    # - cut trims the result to only show the uptime value before the first comma
    uptime | awk -F "up " '{print $2}' | cut -d, -f1

    # Pause for 5 seconds before repeating the loop
    sleep 5
done
