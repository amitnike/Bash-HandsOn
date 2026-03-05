#!/bin/bash

#Create a script that audits user accounts and file permissions in a system. 
#The script should list all users, their last login time, and check for any files in sensitive directories (like /etc or /var) with permissions that are too permissive (e.g., world-writable files).


# Usage: ./13Task.sh


LOGFILE="system_audit.log"

echo "System Audit Report - $(date)" > "$LOGFILE"
echo "----------------------------------------" >> "$LOGFILE"

# List all users from /etc/passwd
echo "User Accounts:" >> "$LOGFILE"
cut -d: -f1 /etc/passwd >> "$LOGFILE"
echo "----------------------------------------" >> "$LOGFILE"

# Last login time for each user
echo "Last Login Times:" >> "$LOGFILE"
lastlog  >> "$LOGFILE"
echo "----------------------------------------" >> "$LOGFILE"

# Check for world-writable files in /etc and /var
echo "World-writable files in /etc:" >> "$LOGFILE"
find /etc -type f -perm -0002 -ls >> "$LOGFILE"

echo "World-writable files in /var:" >> "$LOGFILE"
find /var -type f -perm -0002 -ls >> "$LOGFILE"

echo "----------------------------------------" >> "$LOGFILE"
echo "Audit complete. Results saved to $LOGFILE"
