
#!/bin/bash

# System Audit Script
# Objective: Audit user accounts and file permissions in the system.
# The script will:
#   - List all users
#   - Show their last login times
#   - Check sensitive directories (/etc and /var) for world-writable files

# Usage: ./13Task.sh

# Define the log file where results will be stored
LOGFILE="system_audit.log"

# Write header information into the log file
echo "System Audit Report - $(date)" > "$LOGFILE"
echo "----------------------------------------" >> "$LOGFILE"

# List all users from /etc/passwd
# cut -d: -f1 extracts the first field (username) from each line
echo "User Accounts:" >> "$LOGFILE"
cut -d: -f1 /etc/passwd >> "$LOGFILE"
echo "----------------------------------------" >> "$LOGFILE"

# Display last login time for each user
# lastlog shows the most recent login for all users
echo "Last Login Times:" >> "$LOGFILE"
lastlog >> "$LOGFILE"
echo "----------------------------------------" >> "$LOGFILE"

# Check for world-writable files in /etc
# find -perm -0002 finds files with "others" write permission
# -ls lists details of those files
echo "World-writable files in /etc:" >> "$LOGFILE"
find /etc -type f -perm -0002 -ls >> "$LOGFILE"

# Check for world-writable files in /var
echo "World-writable files in /var:" >> "$LOGFILE"
find /var -type f -perm -0002 -ls >> "$LOGFILE"

# End of report
echo "----------------------------------------" >> "$LOGFILE"
echo "Audit complete. Results saved to $LOGFILE"