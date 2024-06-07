### Linux Shell Scripting Basics

Linux shell scripting is a way to automate tasks in the Unix/Linux environment. A shell script is a text file containing a sequence of commands for a Unix-based operating system's shell to execute. Shell scripting is a powerful tool for automating tasks in a Linux environment. Using variables, control flow, functions, and input/output redirection, you can create scripts to perform a wide range of tasks efficiently. Always start your scripts with a shebang to specify the interpreter, and use comments to document your code for better readability and maintenance.

### Why use Shell Scripts?

1) Automation 
2) Efficiency
3) Customization
4) Reusability

### Steps for Linux Shell Scripting

Step1: Get Manual Commands for the requirement

Step2: Select any command line editor like vi, vim and nano to write a script.

Step3:  Write a Bash shell script
	- Now open a text file with anyName and with any extension but will take .sh just to represent that text file is a shell script.
        - Write first line as a shebang line (#!/bin/bash)
        - Paste all required commands in a sequence

Step4: Executing Bash Shell Script
        - Provide the Execution Permission using chmod +x script_name.sh
        - Run with ./script_name.sh  or <complete_path>/script_name.sh

### Simple User Creation Script

```

#!/bin/bash

# Check if the script is run as root
if ["$(id -u)" -ne 0]; then
        echo "This script must be run as root. Please run with sudo."
        exit 1
fi

# Prompt for the username
read -p "Enter the new username: " username

# Prompt for the password
read -s -p "Enter the password for $username: " password
echo

# Create the user
useradd -m -s /bin/bash "$username"

# Confirm if the user was created
echo "User $username has been created."

```

### Steps to Execute the Script

1) Save the Script: Save the script to a file, e.g., create_user.sh.
2) Make the Script Executable: Run chmod +x create_user.sh.
3) Execute the Script with Root Privileges: Run sudo ./create_user.sh.

### Script Breakdown

1) Check for Root Privileges: The script checks if it is run as root using $(id -u) -ne 0. If not, it exits with a message.
2) Prompt for Username: read -p "Enter the new username: " username prompts the user to enter the new username.
3) Prompt for Password: read -s -p "Enter the password for $username: " password prompts the user to enter the password without echoing it to the screen.
4) Prompt for Group: This step is optional. If the group is specified, the user will be added to this group.
5) Create the User: useradd -m -s /bin/bash "$username" creates a new user with a home directory and default shell.
6) Set the Password: echo "$username:$password" | chpasswd sets the password for the new user.
7) Add to Group: usermod -aG "$group" "$username" adds the user to the specified group if one was provided.

This script is a simple way to create new users in Ubuntu. For more advanced user management, you might want to add additional error checking and handling.




