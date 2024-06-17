#!/bin/bash
# while loop example

count=1
while [ $count -le 5 ]; do
	echo "Count: $count"
	count=$((count + 1))
done
