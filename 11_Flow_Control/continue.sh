#!/bin/bash
# continue example

for i in {1..10}; do
    if [ "$i" -eq 5 ]; then
        continue
    fi
    echo "Number: $i"
done
