#!/bin/bash

#### Passing arguments to a function

# $1 is the first argument passed to the function, 
# $2 is the second, and so on. 
# $n represents the nth argument passed to the function.
# $@ represents all arguments passed to the function.
# $# represents the number of arguments passed to the function.
#


# A function that accepts a name and age
user_info() {
  echo "Welcome, $1!"
  echo "You are $3 years old."
  echo "She learns $2"
}
# Call the function wth arguments
user_info "Lily" "Linux" "30"
