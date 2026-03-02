#!/bin/bash
# Description: Waits until a specific file exists.

FILE_TO_WATCH="data_import_complete.flag"

echo "Waiting for $FILE_TO_WATCH to appear..."

until [ -f "$FILE_TO_WATCH" ]; do
    echo "File not found yet. Sleeping for 2 seconds..."
    sleep 2
done

echo "$FILE_TO_WATCH has appeared! Proceeding with data processing."
# Optional: rm "$FILE_TO_WATCH" to clean up
