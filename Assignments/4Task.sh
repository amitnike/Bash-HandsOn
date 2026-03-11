#!/bin/bash

# Countdown Timer Script
# This script asks the user for a duration in seconds and then displays
# a countdown timer that updates every second until it reaches zero.
# It uses a loop combined with the sleep command for real-time updates.

# Define a function to show the timer
show_timer() {
    local DURATION=$1  # Store the duration passed as an argument into a local variable

    # Loop until the duration reaches zero
    while [ "$DURATION" -gt 0 ]; do
        clear  # Clear the terminal screen for a clean display
        echo "Time remaining: $DURATION seconds"  # Show the remaining time
        sleep 1  # Wait for 1 second
        DURATION=$((DURATION - 1))  # Decrease the duration by 1
    done

    # When the loop ends, display that the countdown is finished
    echo "Time's up!"
}

# Prompt the user to enter the duration in seconds
read -p "Enter the duration in seconds: " DURATION

# Validate the input:
# 1. Check if the input is numeric using a regex
if ! [[ "$DURATION" =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Please enter a numeric value."
    exit 1

# 2. Ensure the number is greater than zero
elif [ "$DURATION" -le 0 ]; then
    echo "Invalid input. Please enter a number greater than 0."
    exit 1

# 3. If valid, call the show_timer function with the user’s input
else 
    show_timer "$DURATION"
fi