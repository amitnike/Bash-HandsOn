
#!/bin/bash

# Log File Analyzer Script
# Objective: Analyze a specified log file (e.g., Apache or Nginx access log).
# The script extracts:
#   - Most frequent IP addresses
#   - Most requested URLs
#   - Error codes (like 404 or 500) and their counts
# Usage Example: ./12Task.sh access.log

# Capture the log file name from the first argument
LOGFILE=$1

# Validate that a log file argument was provided
if [ -z "$LOGFILE" ]; then
  echo "Usage: $0 <logfile>"
  exit 1
fi

# Check if the specified file exists
if [ ! -f "$LOGFILE" ]; then
  echo "Error: Log file '$LOGFILE' does not exist."
  exit 1
fi

echo "Analyzing log file: $LOGFILE"
echo "-----------------------------------"

# Extract and display the top 10 IP addresses
# $1 → first column in access logs (client IP)
# sort → sort IPs
# uniq -c → count occurrences
# sort -nr → sort numerically in reverse (highest first)
# head -10 → show top 10 results
echo "Top 10 IP addresses:"
awk '{print $1}' "$LOGFILE" | sort | uniq -c | sort -nr | head -10
echo "-----------------------------------"

# Extract and display the top 10 requested URLs
# $7 → seventh column in access logs (request URL path)
echo "Top 10 requested URLs:"
awk '{print $7}' "$LOGFILE" | sort | uniq -c | sort -nr | head -10
echo "-----------------------------------"

# Extract and count error codes (4xx and 5xx)
# $9 → ninth column in access logs (HTTP status code)
# grep -E '^[45][0-9][0-9]$' → filter only 4xx and 5xx codes
echo "Error codes count:"
awk '{print $9}' "$LOGFILE" | grep -E '^[45][0-9][0-9]$' | sort | uniq -c | sort -nr
echo "-----------------------------------"
