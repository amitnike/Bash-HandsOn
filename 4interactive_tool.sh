#!/bin/bash


FIRST_NAME="John"
LAST_NAME="Doe"

FULL_NAME="${FIRST_NAME} ${LAST_NAME}"
echo  "Welcome ${FULL_NAME} to the world of unix"

read -p "What is your favourite color?" USER_COLOR
echo "Nice! ${USER_COLOR} is a great color."

# --- COMMAND SUBSTITUTION ---
CURRENT_DIRECTORY=$(pwd)
echo "You are currently in this directory: ${CURRENT_DIRECTORY}"

TODAY_DATE=$(date +"%A, %B %d, %Y")
echo "Today is ${TODAY_DATE}."

if ! command -v htop &>/dev/null; then
    echo -e "\n htop is not installed...installing"
    if sudo apt update && sudo apt install -y htop; then
        echo "htop installed successfully. Launching..."
        htop
    else
        echo "Failed to install htop. Please install manually:"
        echo "  sudo apt update && sudo apt install htop"
        exit 1
    fi
else
    echo -e "\nLaunching htop (press 'q' to quit)..."
    htop

fi
echo -e "\nscipt completed!"
