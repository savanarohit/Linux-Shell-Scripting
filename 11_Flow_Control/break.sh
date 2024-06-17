#!/bin/bash
# break example

for i in {1..6}; do
    if [ "$i" -eq 4 ]; then
        break
    fi
    echo "Number: $i"
done
