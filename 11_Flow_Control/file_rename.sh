#!/bin/bash
# A Script for renaming all files in a directory

# Dir name
dir="/opt/test"

# New Files prefix
prefix="updated_"

# Change to Dir
cd $dir

# Using for loop
for file in *; do
    if [ -f "$file" ]; then
        mv "$file" "${prefix}${file}"
        echo "Renamed $file to ${prefix}${file}"
    fi
done
