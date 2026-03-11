#!/bin/bash

# Network Health Monitor Script
# Objective: This script checks the network health of your server.
# It pings a set of predefined IPs or domain names and reports any failures along with the timestamp.
# The script logs this information into a file and can be extended to send alerts (e.g., via email).

# Define the list of IPs or domain names to ping
SERVERS=("google.com" "amazon.com" "facebook.com" "doesnotexist.test")

# Function to check network health for a given server
check_network(){
    local SERVER=$1                 # Store the server/domain name passed as an argument
    LOGFILE="network_health.log"    # Log file to store results

    # Check if the log file exists; if not, create it
    if [ ! -f $LOGFILE ]; then
        touch $LOGFILE
    fi

    # Get the current timestamp in YYYY-MM-DD HH:MM:SS format
    TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

    # Perform a ping test (-c 1 sends only one packet)
    # Redirect output to /dev/null to suppress details
    if ping -c 1 $SERVER > /dev/null 2>&1 ; then
        # If ping succeeds, log that the server is reachable
        echo "$TIMESTAMP - $SERVER is reachable." >> $LOGFILE
    else
        # If ping fails, log that the server is NOT reachable
        echo "$TIMESTAMP - $SERVER is NOT reachable." >> $LOGFILE
        # Placeholder: Here you could add code to send an alert email or notification
    fi
}

# Main loop to check network health periodically
while true; do
    # Get the size of the SERVERS array (number of servers to check)
    SIZE=${#SERVERS[@]}

    # Generate a random index using RANDOM and modulo to stay within array bounds
    INDEX=$((RANDOM % SIZE))

    # Select a random server from the SERVERS array
    SERVER=${SERVERS[INDEX]}

    # Display which server is being checked
    echo "Checking network health for $SERVER..."

    # Call the function to check the selected server
    check_network "${SERVER}"

    # Wait for 10 seconds before checking again
    sleep 10
done