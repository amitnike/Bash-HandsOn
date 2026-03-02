#!/bin/bash

# This function checks for the existence of a file passed as an argument.
check_file() {
  # We test if a file (-f) exists at the path given by the first argument ($1).
  if [ -f "$1" ]; then
    echo "File '$1' found."
    return 0 # Explicitly return a success code.
  else
    echo "File '$1' not found."
    return 1 # Explicitly return an error code.
  fi
}


# The special variable '$?' ALWAYS holds the exit status of the most recently executed command.
check_return_code(){
    if [ $? -eq 0 ]; then
        echo "Verification check was successful."
    else
        echo "Verification check failed."
fi

}

check_file "my_document.txt"
echo $?
check_return_code
echo "--------------------"

# Now, create the file and run the check again.
touch "my_document.txt"

check_file "my_document.txt"
echo $?
check_return_code

# Clean up the dummy file.
rm "my_document.txt"
