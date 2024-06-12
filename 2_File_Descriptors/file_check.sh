#!/bin/bash
# Script to check if the passwd file is present or not
if [[ -e "/etc/passwd" ]];
then
    echo "passwd file exists"
else
    echo "File not found"
fi
