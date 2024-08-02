#!/bin/bash
# Script for deleting a user account

# Prompt for the username to delete
read -p "Enter the username of the account to delete: " username

# Delete the user account and remove their home directory
sudo userdel -r "$username"

# Check if the userdel command was successful
if [ $? -eq 0 ]; then
    echo "User account deleted: $username"
else
    echo "Failed to delete user account: $username"
fi

