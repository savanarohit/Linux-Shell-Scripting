#!/bin/bash
# Script for eb Server Log Analysis

# Log File
log_file="/var/log/apache2/access.log"

# Check if the file exists
if [[ ! -f $log_file ]]; then
    echo "Log file not found"
    exit 1
fi

# Count the number of HTTP requests
echo "Total number of HTTP requetst:"
awk 'END {print NR}' "$log_file"

# Top 5 IP addresses making HTTP requests
echo "Top 5 IP addresses making HTTP requests:"
awk '{print $1}' "$log_file" | sort | uniq -c | sort -nr | head -5

# HTTP Status codes
echo "HTTP status code:"
awk '{status[$9]++} END {for (code in status) print code, status[code]}' "$log_file" | sort -k2 -nr

# Total bytes sent
echo "Total bytes sent:"
awk '{sum += $10 } END {print sum}' "$log_file"
