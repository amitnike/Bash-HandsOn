#!/bin/bash

# Write a script that asks the user for a duration in seconds and displays a countdown timer that updates every second until it reaches zero.
# Combine a loop with the sleep command for real-time updates.

show_timer() {
    local DURATION=$1  # Remove the space between '=' and '$1'
    while [ "$DURATION" -gt 0 ]; do
        clear
        echo "Time remaining: $DURATION seconds"
        sleep 1
        DURATION=$((DURATION - 1))
    done
    echo "Time's up!"
}

read -p "Enter the duration in seconds: " DURATION

if ! [[ "$DURATION" =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Please enter a numeric value."
    exit 1
elif [ "$DURATION" -le 0 ]; then  # Changed '-lt' to '-le' for proper validation
    echo "Invalid input. Please enter a number greater than 0."
    exit 1
else 
    show_timer "$DURATION"  # Pass DURATION as an argument to the function
fi