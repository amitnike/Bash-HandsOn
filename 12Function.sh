#!/bin/bash

# This function prints the current system time.
function print_time() {
  echo "The current time is:"
  date
}

#declare the function by with function_  at the beginning of the function name
function_time(){
    echo "This function returns the date:"
    date
}

echo "About to call the print_time function."
# Call the function print_time
print_time
echo "About to call the function_name function."
# call the function function_time
function_time
echo "Function has been called."
