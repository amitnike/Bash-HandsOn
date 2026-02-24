#!/bin/bash
# This is a shebang. It tells the system to use Bash to run this script.

# --- VARIABLES ---
# 1. Declare a variable. Note: No spaces around the '=' sign.
GREETING="Hello"

# 2. Use the variable by prefixing its name with a '$'.
echo "The script says: $GREETING"

# --- USER INPUT ---
#3. Prompt the user for their name.
echo "What is your name?"
read USER_NAME

# 4. Prompt for age.
echo "How old are you?"
read USER_AGE

# 5. Print a personalized message using the variables.
#    Using curly braces {} is good practice to avoid ambiguity.
echo "Hello, ${USER_NAME}! You are ${USER_AGE} years old."

# 6. Using command substitution to store a command's output in a variable.
CURRENT_DIRECTORY=$(pwd)
echo "You are currently in the following directory: ${CURRENT_DIRECTORY}"

# 7. Print OS Version
echo "=== OS Version ==="
if [ -f /etc/os-release ]; then
    . /etc/os-release
    echo "OS: $NAME $VERSION"
else
    echo "OS: Unknown (No /etc/os-release)"
fi

# 8. Print Kernel Version (fallback/extra info)
echo "Kernel: $(uname -r)"
echo

# 9. List Files and Folders in Root Directory (/)
echo "=== Files and Folders in Root Directory (/) ==="
ls -la /

