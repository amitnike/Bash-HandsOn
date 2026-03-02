#!/bin/bash
# Description: Prompts the user until they provide a valid 'yes' or 'no'.

# Loop UNTIL the answer is 'yes' or 'no'
until [[ "$ANSWER" == "yes" || "$ANSWER" == "no" ]]; do
    read -p "This is a destructive action. Proceed? (yes/no): " ANSWER
done

if [[ "$ANSWER" == "yes" ]]; then
    echo "Proceeding with action..."
else
    echo "Aborting."
fi
