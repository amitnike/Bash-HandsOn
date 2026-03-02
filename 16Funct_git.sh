#!/bin/bash

#Scenario 1. Automated Application Deployment
# A DevOps engineer needs a script to automate pulling the latest code from a Git repository, installing dependencies, and restarting the application server.

# Best Practices you need to follow:
# Functions for modularity (e.g., pull_code, install_dependencies).
# Variables for configuration.
# Error checking after each major step.
# Clear log messages for traceability.

# # --- Configuration ---
# REPO_URL = "https://github.com/amitnike/hello-world.git"
# APP_DIR="/var/www/my-app"
# GIT_BRANCH="main"
# LOG_FILE="/var/log/deployment.log"

# Example Output
# Tue Sep 30 15:30:00 UTC 2025 - ====== Starting New Deployment ======
# Tue Sep 30 15:30:00 UTC 2025 - Navigating to application directory: /var/www/my-app
# Tue Sep 30 15:30:01 UTC 2025 - Pulling latest code from branch: main
# Tue Sep 30 15:30:03 UTC 2025 - Installing project dependencies...
# Tue Sep 30 15:30:10 UTC 2025 - Restarting application server...
# Tue Sep 30 15:30:11 UTC 2025 - ====== Deployment Successful ======



# --- Configuration ---
REPO_URL="https://github.com/amitnike/SampleSpringBatch.git"
APP_DIR="$(pwd)/var/www/my-app"
GIT_BRANCH="main"
LOG_DIR="$(pwd)/var/log"
FILENAME="${LOG_DIR}/deployment.log"

# --- Functions ---

check_folder(){
    local directory="$1"
    if [ -d "$directory" ]; then
        log_message "Directory '${directory}' already exists."
    else
        log_message "Directory '${directory}' not found. Creating it now..."
        mkdir -p "$directory" || { log_message "Failed to create directory: $directory"; exit 1; }
        log_message "Directory created: ${directory}"
        touch "$FILENAME"
    fi
}

log_message(){
    local message="$1"
    local timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    echo "${timestamp} - ${message}" | tee -a "$FILENAME"
}
 

pull_code() {
    if [ -d "$APP_DIR" ]; then
        log_message "Application directory already exists: $APP_DIR"
    else
        mkdir -p "$APP_DIR" || { log_message "Failed to create application directory: $APP_DIR"; exit 1; }
    fi
          
    REPO_NAME=$(basename "$REPO_URL" .git)
    echo "Repository name: $REPO_NAME"

    if [ -d "$APP_DIR/$REPO_NAME" ]; then
        log_message "Repository already exists: $APP_DIR/$REPO_NAME"
    else
        cd "$APP_DIR" || { log_message "Failed to navigate to $APP_DIR"; exit 1; }
        log_message "Cloning repository from $REPO_URL to $APP_DIR"
        git clone --branch "$GIT_BRANCH" "$REPO_URL"  || {
        log_message "Failed to clone Git repository."
        exit 1
        }
    fi

    cd "$APP_DIR/$REPO_NAME" || { log_message "Failed to navigate to the repository directory: $APP_DIR/$REPO_NAME"; exit 1; }
}

install_dependencies() {
    log_message "Installing project dependencies..."
    # Replace the following command with the appropriate one for your project
    mvn clean install || { log_message "Failed to install dependencies."; exit 1; }
}

restart_server() {
    log_message "Restarting application server..."
    # Replace the following command with the appropriate one for your server
    #systemctl restart my-app || { log_message "Failed to restart the application server."; exit 1; }
}

# --- Main Script ---
check_folder "$LOG_DIR"
log_message "====== Starting New Deployment ======"
pull_code
install_dependencies
restart_server
log_message "====== Deployment Successful ======"