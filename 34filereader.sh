#!/bin/bash

LOG_FILE="app.log"

if [ ! -f "$LOG_FILE" ]; then
    echo "Error: Log file '$LOG_FILE' not found."
    exit 1
fi


ERROR_COUNT=0
WARNING_COUNT=0


while IFS= read -r LINE; do
    if [[ "$LINE" == *"ERROR"* ]]; then
        echo "Found ERROR: $LINE"
        ((ERROR_COUNT++))
    elif [[ "$LINE" == *"WARN"* ]]; then
        echo "Found WARNING: $LINE"
        ((WARNING_COUNT++))
    fi
done < "$LOG_FILE"


echo "-------------------------------"
echo "Analysis Complete."
echo "Total Errors: $ERROR_COUNT"
echo "Total Warnings: $WARNING_COUNT"