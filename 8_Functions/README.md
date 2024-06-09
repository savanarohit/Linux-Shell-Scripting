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
greet "Bob"

# End of the script
```