#!/bin/bash

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root. Please run with sudo."
    exit 1
fi

# Prompt for the username
read -p "Enter the new username: " username

# Prompt for the password
read -s -p "Enter the password for $username: " password
echo

# Prompt for the group (optional)
read -p "Enter the group for $username (leave blank for default): " group

# Create the user
useradd -m -s /bin/bash "$username"

# Set the user's password
echo "$username:$password" | chpasswd

# Add the user to the specified group if provided
if [ -n "$group" ]; then
    usermod -aG "$group" "$username"
fi

# Confirm the user was created
echo "User $username has been created."

# Check if user was added to the specified group
if [ -n "$group" ]; then
    echo "User $username has been added to the group $group."
fi
