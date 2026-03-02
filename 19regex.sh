#!/bin/bash


grade_check() {
    local score="$1"  # Accept the argument and assign it to a local variable

    if [ "$score" -ge 90 ]; then
        echo "Grade: A"
    elif [ "$score" -ge 80 ] && [ "$score" -lt 90 ]; then
        echo "Grade: B"
    elif [ "$score" -ge 70 ] && [ "$score" -lt 80 ]; then
        echo "Grade: C"
    elif [ "$score" -ge 60 ] && [ "$score" -lt 70 ]; then
        echo "Grade: D"
    else
        echo "Grade: F"
    fi
}


read -p "Enter the score (0-100): " SCORE

if ! [[ "$SCORE" =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Please enter a numeric value."
    exit 1
elif [ "$SCORE" -lt 0 ] || [ "$SCORE" -gt 100 ]; then
    echo "Invalid score. Please enter a number between 0 and 100."
    exit 1
else 
    grade_check "$SCORE"  # Pass SCORE as an argument to the function
fi