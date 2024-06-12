#!/bin/bash
# Shell Script for greet Functions

# Greet Function
greet() {
    # $1 is the first parameter passed to the function
    local name=$1
    echo "Hello , $name! "
}

greet "World"
