#!/bin/bash

check_file() {
  if [ -f "$1" ]; then
    echo "File found."
    return 0 # Success
  else
    echo "File not found."
    return 1 # Failure
  fi
}

check_file "my_document.txt"
# The special variable $? holds the exit status of the last command
if [ $? -eq 0 ]; then
  echo "Operation was successful."
else
  echo "Operation failed."
fi
