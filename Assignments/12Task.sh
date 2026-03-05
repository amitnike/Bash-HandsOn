#!/bin/bash

#Develop a script that analyzes a specified log file (e.g., Apache or Nginx access log) and extracts information such as the most frequent IP addresses and request URLs.
# The script should also identify any error codes (like 404 or 500) and count their occurrences.

# Example: ./12Task.sh access.log

# Check if a log file is provided as an argument
LOGFILE=$1

# Validate the log file argument
if [ -z "$LOGFILE" ]; then
  echo "Usage: $0 <logfile>"
  exit 1
fi

#check if file exist or not. If it does not exist, exit the script with an error message.
if [ ! -f "$LOGFILE" ]; then
  echo "Error: Log file '$LOGFILE' does not exist."
  exit 1
fi

echo "Analyzing log file: $LOGFILE"
echo "-----------------------------------"

# Top 10 IP addresses
echo "Top 10 IP addresses:"
awk '{print $1}' "$LOGFILE" | sort | uniq -c | sort -nr | head -10
echo "-----------------------------------"

# Top 10 requested URLs
echo "Top 10 requested URLs:"
awk '{print $7}' "$LOGFILE" | sort | uniq -c | sort -nr | head -10
echo "-----------------------------------"

# Error codes (4xx and 5xx)
echo "Error codes count:"
awk '{print $9}' "$LOGFILE" | grep -E '^[45][0-9][0-9]$' | sort | uniq -c | sort -nr
echo "-----------------------------------"
