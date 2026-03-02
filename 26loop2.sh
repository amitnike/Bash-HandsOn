#!/bin/bash
# Description: Counts down from 5 to 1.

echo "Starting countdown:"
for (( i=5; i>=1; i-- )); do
    echo "$i..."
    sleep 1 # Pause for 1 second
done
echo "Blast Off!"
