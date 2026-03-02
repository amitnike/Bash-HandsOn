#!/bin/bash

#1. Prompt the user for their name.
echo "What is your name?"
read USER_NAME

while true; do
    #echo $(date)
    DAY=$(date +"%A")
    DATE=$(date +"%d %B %Y")
    TIME=$(date +"%H.%M %p")
    echo "Good Morning, $USER_NAME! It's $DAY, $DATE $TIME."
    sleep 60
done