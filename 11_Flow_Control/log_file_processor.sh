#!/bin/bash
# Script to backup log file to a backup dir

# Log file
log_file="/var/log/apache2/access.log"
backup_dir="/opt/backup"

# Create backup dir
mkdir -p "$backup_dir"

# Message
echo "Backup for log files $log_file starts...."

while true; do
    if [ -f "$log_file" ]; then
        echo "$(date): $log_file found. Processing it now..."
        mv "$log_file" "$backup_dir/special_$(date +"%Y%m%d_%H%M%S").log"
        echo "$(date): $log_file backup kept in $backup_dir"
        break
    else
        echo "$(date): $log_file not found."

    fi
    sleep 10

done

echo "Log file backup completed"
