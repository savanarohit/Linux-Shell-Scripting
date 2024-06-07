#!/bin/bash
if [[ -e "/etc/passwd" ]];
then 
	echo "passwd file exists"
else
	echo "File not found"
fi
