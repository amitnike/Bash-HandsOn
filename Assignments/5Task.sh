
#!/bin/bash

# Currency Conversion Script
# This script prompts the user for an amount, their local currency, and the target currency.
# It fetches the real-time exchange rate using an API and calculates the converted amount.
# The script runs in a loop for 3 iterations, allowing the user to perform multiple conversions.

# Define a function to perform currency exchange
currecy_exchange() {
    local AMOUNT=$1   # Amount to convert
    local FROM=$2     # Source currency code (e.g., USD, INR)
    local TO=$3       # Target currency code (e.g., EUR, GBP)
    local API_KEY=46fe5fbb79421477b3268d73  # API key for exchangerate-api

    # Construct the API URL using the provided currencies
    URL="https://v6.exchangerate-api.com/v6/${API_KEY}/pair/${FROM}/${TO}" 

    # Fetch exchange rate data using curl
    RESPONSE=$(curl -s "$URL") 

    # Extract the conversion rate from the JSON response using jq
    RATE=$(echo "$RESPONSE" | jq -r '.conversion_rate')
    
    # If RATE is empty, show an error message
    if [ -z "$RATE" ]; then
        echo "Error fetching exchange rate. Please check the currency codes and try again."
        exit 1
    fi

    # Calculate the converted amount using bc (for floating-point arithmetic)
    CONVERTED_AMOUNT=$(echo "$AMOUNT * $RATE" | bc -l)
    
    # Display the result to the user
    echo "$AMOUNT $FROM is equivalent to $CONVERTED_AMOUNT $TO"
}

# Loop exactly 3 times to allow multiple conversions
for i in {1..3}; do
    echo "Conversion attempt $i of 3"

    # Prompt the user for input values
    read -p "Enter the amount in your currency : " AMOUNT
    read -p "Enter your local currency (e.g., USD, INR): " FROM
    read -p "Enter the currency you want to convert to (e.g., EUR, GBP): " TO

    # Validate user input for amount
    if ! [[ "$AMOUNT" =~ ^[0-9]+$ ]]; then
        # Ensure the amount is numeric
        echo "Invalid input. Please enter a numeric value."
        exit 1
    elif [ "$AMOUNT" -le 0 ]; then
        # Ensure the amount is greater than zero
        echo "Invalid input. Please enter a number greater than 0."
        exit 1
    else 
        # If valid, call the currency exchange function
        currecy_exchange "$AMOUNT" "$FROM" "$TO" 
    fi

    echo "----------------------------------------"
done

echo "You have completed 3 conversions. Exiting script."