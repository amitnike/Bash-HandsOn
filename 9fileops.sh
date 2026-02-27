#!/bin/bash

# ============================================================================
# Daily Log Setup Script
#
# Purpose:
#   Automates the creation of a dated log directory and initializes a structured
#   application log file with metadata, startup messages, and timestamps.
#
# Features:
#   - Dynamic directory naming using today's date (YYYY-MM-DD)
#   - Colored console output for clarity
#   - Timestamped log entries
#   - Safe reuse if script is run multiple times per day
#   - Error checking for directory and file creation
#   - Master run log for audit trail
#
# Author: Jerry-Hypha
# Created: $(date '+%Y-%m-%d')
# ============================================================================

# ----------------------------
# Configuration & Variables
# ----------------------------

# Generate log directory name using today's date (e.g., logs_2025-04-05)
LOG_DIR="logs_$(date +%F)"

# Full path to the log file inside the directory
LOG_FILE="${LOG_DIR}/application.log"

# Current timestamp in readable format
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# ANSI color codes for terminal output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color (reset)

# ----------------------------
# Utility Functions
# ----------------------------

# Print an info message in green
print_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

# Print a warning message in yellow
print_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

# Print an error message in red and send to stderr
print_error() {
    echo -e "${RED}[ERROR]${NC} $1" >&2
}

# Append a timestamped message to the log file
# Usage: log_to_file "LEVEL: Message"
log_to_file() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "${LOG_FILE}"
}

# ----------------------------
# Script Execution Starts Here
# ----------------------------

# Notify user that setup has started
print_info "Starting Daily Log Setup"

# Display runtime context
echo "--------------------------------------------------"
echo "Date:        ${TIMESTAMP}"
echo "Log Directory: ${LOG_DIR}"
echo "Log File:      ${LOG_FILE}"
echo "Host:          $(hostname)"
echo "User:          $(whoami)"
echo "Script:        $(basename "$0")"
echo "Author:        Jerry-Hypha"
echo "--------------------------------------------------"

# 1. Create log directory
print_info "Creating log directory: ${LOG_DIR}"

if [[ -d "${LOG_DIR}" ]]; then
    print_warn "Directory already exists. Reusing: ${LOG_DIR}"
else
    mkdir "${LOG_DIR}" 2>/dev/null
    if [[ $? -eq 0 ]]; then
        print_info "Successfully created directory: ${LOG_DIR}"
    else
        print_error "Failed to create directory: ${LOG_DIR}"
        print_error "Please check your permissions or available disk space."
        exit 1
    fi
fi

# 2. Create or reset the log file
print_info "Initializing log file: ${LOG_FILE}"
touch "${LOG_FILE}" 2>/dev/null

# Verify the file was created
if [[ ! -f "${LOG_FILE}" ]]; then
    print_error "Failed to create log file: ${LOG_FILE}"
    exit 1
fi

# 3. Write structured header to the log file (overwrite mode)
print_info "Writing header to log file"
{
    echo "==========================================="
    echo "       APPLICATION LOG FILE"
    echo "-------------------------------------------"
    echo "Date:     $(date)"
    echo "Host:     $(hostname)"
    echo "User:     $(whoami)"
    echo "Log Path: ${LOG_FILE}"
    echo "Script:   $(basename "$0")"
    echo "Author:   Jerry-Hypha"
    echo "==========================================="
} > "${LOG_FILE}"

# 4. Append timestamped startup message
log_to_file "INFO: Application starting up."
print_info "Startup event logged with timestamp."

# 5. Display current content of the log file
print_info "Current content of ${LOG_FILE}:"
echo "--------------------------------------------------"
cat "${LOG_FILE}"
echo "--------------------------------------------------"

# 6. Update master run log (keeps history across days)
MASTER_LOG="master_run_log.txt"
echo "[$TIMESTAMP] Initialized logs in ${LOG_DIR}" >> "${MASTER_LOG}"
log_to_file "INFO: Daily log setup completed successfully."

print_info "Master run history updated: ${MASTER_LOG}"

# 7. Provide cleanup and inspection instructions
echo ""
print_info "Setup complete!"
echo "To clean up today's logs, run:"
echo "   rm -r ${LOG_DIR}"
echo ""
print_info "To view files in the log directory, run:"
echo "   ls -la ${LOG_DIR}/"

# Exit successfully
exit 0

