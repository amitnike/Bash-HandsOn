#!/bin/bash

echo "--- Simple System Utility Menu ---"

# Set the prompt for the select menu
PS3="Please choose a utility (1-${#options[@]}): "

# Define the menu options
options=(
    "Check Disk Usage"
    "List Running Processes"
    "Show System Uptime"
    "Display Memory Information"
    "Quit"
)

# Function to display section headers
section() {
    echo
    echo "--- $1 ---"
}

# Start the select loop
while true; do
    select opt in "${options[@]}"; do
        case $opt in
            "Check Disk Usage")
                section "Disk Usage"
                df -h --output=source,size,used,avail,pcent,target | grep -v 'tmpfs\|udev'
                break
                ;;
            "List Running Processes")
                section "Running Processes (Top 5)"
                ps -eo pid,user,comm --sort=-%cpu | head -n 6
                break
                ;;
            "Show System Uptime")
                section "System Uptime"
                uptime -p
                break
                ;;
            "Display Memory Information")
                section "Memory Information"
                free -h
                break
                ;;
            "Quit")
                echo "Exiting menu. Goodbye!"
                exit 0
                ;;
            *)
                echo -e "\nInvalid option $REPLY. Please choose 1-${#options[@]}."
                continue
                ;;
        esac
    done
    echo # Add spacing between menu displays
done
echo "--- End of Activity ---"
