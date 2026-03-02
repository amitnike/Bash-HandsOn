#!/bin/bash
# Description: Greets each person in a list.

NAMES=(Alice Bob Charlie "Mary Jane" David)  # Define an array

echo "Greeting everyone:"
for NAME in "${NAMES[@]}"; do  # Iterate over the array
#for NAME in $NAMES; do
    echo "Hello, $NAME!"
done