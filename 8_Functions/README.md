#### Functions

Functions in shell scripting are blocks of code that perform a specific task and can be reused multiple times within the script.

#### Example - A Function to Greet Users
```
#!/bin/bash

# Define a function named greet
greet() {
    # $1 is the first parameter passed to the function
    local name=$1
    echo "Hello, $name! Welcome to shell scripting."
}

# Call the function with a parameter
greet "Alice"

```

#### Example - Simple Function

```
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


Output

nixmin@DESKTOP:~$ ./simplefunction.sh
Input absolute path of the file /etc/passwd
Input operations type [r,c,d]r
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin

```