#!/bin/bash

#Write a script that displays essential system information like the current user, hostname, and operating system version in real-time. 
#Update the script to display this information periodically (e.g., every minute). 
#(Use commands like whoami, hostname, and uname -r to retrieve the information)


# Function to display system information
display_system_info() {
    clear
    echo "Current User: $(whoami)"
    echo "Hostname: $(hostname)"
    echo "Operating System Version: $(uname -r)"
}

# Main loop to update system information every minute
while true; do
    display_system_info
    sleep 60  # Update every 60 seconds (1 minute)
done