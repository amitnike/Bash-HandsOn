#!/bin/bash
# Description: A simple menu that keeps running until the user quits.

CHOICE=""

while [ "$CHOICE" != "q" ]; do
    echo -e "\n--- Simple Menu ---"
    echo "1. Say Hello"
    echo "2. Show Date"
    echo "q. Quit"
    read -p "Enter your choice: " CHOICE

    case "$CHOICE" in
        1) echo "Hello there!" ;;
        2) date ;;
        q) echo "Exiting. Goodbye!" ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
done
