#!/bin/bash
# =====================================================
# CPU Monitor Script - Ubuntu 22.04
# Real-time CPU monitoring with tiered alerts
# =====================================================


#critical threshold set to 90
CRITICAL_THRESHOLD=${1:-90}
#warning threshold set to 75
WARNING_THRESHOLD=${2:-75}
#interval set to 5 seconds
INTERVAL=${3:-5}
LOG_FILE="./cpu_monitor.log"

get_cpu_usage() {
    top -bn1 | awk -F',' '
    /Cpu\(s\)/ {
        for(i=1;i<=NF;i++){
            if($i ~ /id/){
                gsub(/[^0-9.]/,"",$i)
                printf "%.0f", 100 - $i
            }
        }
    }'
}

log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

echo "Starting CPU Monitor..."
echo "Critical Threshold: ${CRITICAL_THRESHOLD}%"
echo "Warning Threshold: ${WARNING_THRESHOLD}%"
echo "Check Interval: ${INTERVAL} seconds"
echo "Logging to: ${LOG_FILE}"
echo "-----------------------------------------"

while true; do

    CPU_USAGE=$(get_cpu_usage)

    if ! [[ "$CPU_USAGE" =~ ^[0-9]+$ ]]; then
        log_message "ERROR: Unable to parse CPU usage."
        exit 1
    fi

    if (( CPU_USAGE >= CRITICAL_THRESHOLD )); then
        log_message "ALERT: CPU usage CRITICAL (${CPU_USAGE}%)"
    elif (( CPU_USAGE >= WARNING_THRESHOLD )); then
        log_message "WARNING: CPU usage HIGH (${CPU_USAGE}%)"
    else
        log_message "INFO: CPU usage NORMAL (${CPU_USAGE}%)"
    fi

    sleep "$INTERVAL"
done

