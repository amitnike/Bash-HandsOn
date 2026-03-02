#!/bin/bash
# Description: Reads a CSV file of users and creates an account for each.

# Create a fake CSV for our lab
cat > users.csv << EOL
jdoe,John Doe,Sales
msmith,Mary Smith,Engineering
EOL

echo "Processing new user accounts from users.csv..."

# Set the Internal Field Separator (IFS) to a comma for this loop
# The -r option to 'read' prevents backslash processing
while IFS=',' read -r USERNAME FULL_NAME DEPT; do
    echo "  -> Creating user: $USERNAME ($FULL_NAME, $DEPT)"
    # In a real script, you'd use 'useradd'
    # sudo useradd -m -c "$FULL_NAME" -G "$DEPT" "$USERNAME"
done < users.csv # The loop reads its input directly from the file

echo "User processing finished."