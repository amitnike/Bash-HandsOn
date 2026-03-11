#!/bin/bash

# Time Announcer Script
# This script asks the user for their name and then displays
# a personalized greeting along with the current time every minute.

# 1. Prompt the user for their name
echo "What is your name?"

# 2. Read the input from the user and store it in the variable USER_NAME
read USER_NAME

# 3. Start an infinite loop to keep announcing the time every minute
while true; do
    # Get the current day of the week (e.g., Monday, Tuesday)
    DAY=$(date +"%A")

    # Get the current date in the format: Day Month Year (e.g., 27 March 2024)
    DATE=$(date +"%d %B %Y")

    # Get the current time in hours and minutes with AM/PM
    TIME=$(date +"%I:%M %p")

    # Display the personalized greeting with the current day, date, and time
    echo "Good Day, $USER_NAME! It's $DAY, $DATE $TIME."

    # Wait for 60 seconds before repeating the loop
    sleep 60
done
