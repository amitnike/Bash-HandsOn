#!/bin/bash

#Write a script that prompts the user for an amount in their local currency 
#and displays the equivalent value in another currency. 
#Use a loop for continuous input and consider APIs for real-time conversion rates 

read -p "Enter the amount in your currency : " AMOUNT
read -p "Enter your local currency : " FROM
read -p "Enter the currency you want to convert to : " TO

currecy_exchange() {
    local AMOUNT=$1
    local FROM=$2
    local TO=$3
    local API_KEY=46fe5fbb79421477b3268d73

    
    URL="https://v6.exchangerate-api.com/v6/${API_KEY}/pair/${FROM}/${TO}" 
    echo $URL
    # Fetch exchange rate using curl 
    RESPONSE=$(curl -s "$URL") 
    # Extract conversion_rate using jq 
    RATE=$(echo "$RESPONSE" | jq -r '.conversion_rate')
    
    if [ -z "$RATE" ]; then
        echo "Error fetching exchange rate. Please check the currency codes and try again."
        exit 1
    fi

    # Calculate the converted amount
    CONVERTED_AMOUNT=$(echo "$AMOUNT * $RATE" | bc -l)
    
    echo "$AMOUNT $FROM is equivalent to $CONVERTED_AMOUNT $TO"
}


if ! [[ "$AMOUNT" =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Please enter a numeric value."
    exit 1
elif [ "$AMOUNT" -le 0 ]; then  # Changed '-lt' to '-le' for proper validation
    echo "Invalid input. Please enter a number greater than 0."
    exit 1
else 
    currecy_exchange "$AMOUNT" "$FROM" "$TO" 
fi