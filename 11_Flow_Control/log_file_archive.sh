#!/bin/bash
#  Script to check if the Log file exists and archive it if it does.

# Log File Path
LOG_FILE_PATH="/var/log/apache2/access.log"
FILE_ARCHIVE_PATH="/opt/archive"
    
# Check if the file exists
if [ -f "$LOG_FILE_PATH" ]; then
    echo "Log file exists. Archiving statrted"
    mkdir -p "$FILE_ARCHIVE_PATH"
    mv "$LOG_FILE_PATH" "$FILE_ARCHIVE_PATH/$(date + '%Y-%m-%d_%H-%M-%S')_access.log"
    echo "Log file archived completed."
else
    echo "Log file does not exist."
fi
