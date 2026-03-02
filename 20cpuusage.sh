#!/bin/bash

# Description: Checks CPU usage and provides tiered feedback.

# We will fake the CPU usage for this test. In a real script, you'd parse `top` or `mpstat`.
CPU_USAGE=$1 # We'll provide the usage as a command-line argument

# -z "string": Checks if string is empty (zero length).
if [[ -z "$CPU_USAGE" ]]; then
    echo "Usage: $0 <cpu_percentage>"
    exit 1
fi

# num1 -ge num2: Checks if num1 is greater than or equal to num2.
if [[ "$CPU_USAGE" -ge 90 ]]; then
    echo "ALERT: CPU usage is CRITICAL ($CPU_USAGE%). Paging the on-call engineer."
elif [[ "$CPU_USAGE" -ge 75 ]]; then
    echo "WARNING: CPU usage is HIGH ($CPU_USAGE%). Investigate when possible."
else
    echo "INFO: CPU usage is NORMAL ($CPU_USAGE%)."
fi
