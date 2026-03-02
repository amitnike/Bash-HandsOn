#!/bin/bash
#System Uptime Monitor: Write a script that displays the system uptime and refreshes it every 5 seconds. 
#Use the uptime command and a loop to achieve real-time updating.
while true; do
    clear
    echo "System Uptime:"
    uptime | awk -F "up " '{print $2}' | cut -d, -f1
    sleep 5
done