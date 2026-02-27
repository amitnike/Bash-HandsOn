#!/bin/bash

# Ensure script is run by its owner
SCRIPT_OWNER=$(stat -c '%U' "$0")
CURRENT_USER=$(whoami)

echo "SCRIPT OWNER: " $SCRIPT_OWNER
echo "CURRENT OWNER: "$CURRENT_USER

if [ "$CURRENT_USER" != "$SCRIPT_OWNER" ]; then
    echo "ERROR: This script can only be executed by $SCRIPT_OWNER"
    exit 1
fi

# Load configuration securely
CONFIG_FILE="$(dirname "$0")/10db_config.conf"

if [ ! -f "$CONFIG_FILE" ]; then
    echo "ERROR: Configuration file not found"
    exit 1
fi

# Verify config file permissions
CONFIG_PERMS=$(stat -c '%a' "$CONFIG_FILE")
if [ "$CONFIG_PERMS" -gt 400 ]; then
    echo "ERROR: Configuration file permissions are too open"
    exit 1
fi

# Read configuration (only the owner can read)
source "$CONFIG_FILE"

# Perform sensitive operations (e.g., database backup)
echo "Performing database backup..."
# Replace with actual backup command, for example:
# mysqldump -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" > backup.sql
echo "Backup completed successfully"

