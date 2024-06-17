#!/bin/bash
# until loop example

count=1
until [ $count -gt 5 ]; do
    echo "Count: $count"
    count=$((count + 1))
done
