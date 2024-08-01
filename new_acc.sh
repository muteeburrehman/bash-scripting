#!/bin/bash
# Script for creating a new account
read -p "Enter the username for the new account:" username
sudo useradd -m "$username"
read -s -p "Enter the password for the new account:" password
echo "$username:$password" | sudo chpasswd
if [ $? -eq 0 ];;
then
    echo "New user account created: $username"
else
    echo "User account creation failed"
fi
