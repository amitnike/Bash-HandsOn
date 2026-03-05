#!/bin/bash

#Objective: Create a script that checks the network health of your server. 
#It should ping a set of predefined IPs or domain names and report any failures along with the timestamp. 
#The script should log this information and send an alert (e.g., via email) if any of the pings fail.


# Define the list of IPs or domain names to ping
SERVERS=("google.com" "amazon.com" "facebook.com" "doesnotexist.test")

# Function to check network health
check_network(){
    local SERVER=$1
    LOGFILE="network_health.log"

    #check if file exists or not. If it does not exist, create it.
    if [ ! -f $LOGFILE ]; then
        touch $LOGFILE
    fi
    #do a ping test to the server and check if it is successful
    #if the ping test fails, log the success and failures in the file
    TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
    if ping -c 1 $SERVER > /dev/null 2>&1 ; then
        echo "$TIMESTAMP - $SERVER is reachable." >> $LOGFILE
    else
        echo "$TIMESTAMP - $SERVER is NOT reachable." >> $LOGFILE
        #send an alert email if the ping test fails
    fi

}

# Main loop to check network health every minute
while true; do
    #Get the size of the SERVERS array to determine how many servers we have to check
    SIZE=${#SERVERS[@]}
    # The RANDOM variable generates a random number, and we use modulo to ensure it falls within the bounds of the array size.
    INDEX=$((RANDOM % SIZE))
    SERVER=${SERVERS[INDEX]}
    echo "Checking network health for $SERVER..."
    check_network "${SERVER}"
    sleep 10  # Update every 10 seconds 
done