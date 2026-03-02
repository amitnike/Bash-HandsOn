#!/bin/bash

#Write a script that displays a random fortune message. 
#Use a loop and pre-defined fortunes stored in an array for real-time display.


#create an array of size 25 with pre-defined fortunes 
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

# Function to get a random fortune
display_fortune() {
    # Get the size of the fortunes array
    size=${#FORTUNES[@]}
    # The RANDOM variable generates a random number, and we use modulo to ensure it falls within the bounds of the array size.
    INDEX=$((RANDOM % size))
    # Display the random fortune
    echo "${FORTUNES[INDEX]}"
}

# Loop to display a random fortune every 5 seconds

while true; do
    clear
    display_fortune
    sleep 5
done