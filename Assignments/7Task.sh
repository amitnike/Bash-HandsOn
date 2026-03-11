#!/bin/bash

# Random Fortune Message Script
# This script displays a random fortune message from a pre-defined list.
# It uses an array to store fortunes, a function to select one randomly,
# and a loop to display a new fortune every 5 seconds.

# Create an array with pre-defined fortunes (25 messages)
FORTUNES=(
    "You will have a great day!"
    "A surprise is waiting for you around the corner."
    "Your hard work will soon pay off."
    "An exciting opportunity is on the horizon."
    "You will meet someone special soon."
    "Good news will come to you by mail."
    "Your talents will be recognized and rewarded."
    "A new adventure awaits you."
    "You will find what you are looking for."
    "Happiness is in your future."
    "Your positive attitude will lead to success."
    "You will make a valuable connection today."
    "A pleasant surprise is in store for you."
    "Your dreams are about to come true."
    "You will overcome a challenge with ease."
    "A new friendship will bring joy to your life."
    "Your creativity will shine brightly."
    "You will receive unexpected good news."
    "Your efforts will be appreciated by others."
    "A change for the better is coming your way."
    "You will discover a hidden talent within yourself."
    "Your kindness will be returned to you tenfold."
    "An exciting journey is ahead of you."
)

# Function to display a random fortune
display_fortune() {
    # Get the size of the fortunes array
    size=${#FORTUNES[@]}

    # Generate a random index using the built-in RANDOM variable
    # Modulo ensures the index stays within the array size
    INDEX=$((RANDOM % size))

    # Display the fortune at the random index
    echo "${FORTUNES[INDEX]}"
}

# Infinite loop to display a random fortune every 5 seconds
while true; do
    clear                # Clear the screen for a clean display
    display_fortune      # Call the function to show a random fortune
    sleep 5              # Wait for 5 seconds before showing the next fortune
done