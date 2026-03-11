#!/bin/bash

# System Information Monitor Script
# This script displays essential system information such as:
# - Current user
# - Hostname
# - Operating system version
# It updates the information every minute in real-time.

# Function to display system information
display_system_info() {
    clear  # Clear the terminal screen for a clean display

    # Display the current logged-in user
    echo "Current User: $(whoami)"

    # Display the system hostname
    echo "Hostname: $(hostname)"

    # Display the operating system kernel version
    echo "Operating System Version: $(uname -r)"
}

# Main loop to update system information every minute
while true; do
    display_system_info   # Call the function to show system info
    sleep 60              # Wait for 60 seconds before refreshing
done