#!/bin/bash

# Script to perform basic file operations

usage() {
    echo "$0 absolute path to the file and operations [r,c,d[] as input"
}

read -p "Input absolute path f the file:" path
read -p "Input operations type: [r,c,d]" ops

# Create file function
create() {
    touch $path
}

# Read a file function
read() {
    cat $path
}

# Delete a file function
delete() {
    rm -r $path
}

case $ops in
c)
    create
    ;;
r)
    read
    ;;
d)
    delete
    ;;
*)
    usage
    ;;
esac
