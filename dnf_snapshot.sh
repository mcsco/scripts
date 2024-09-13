#!/bin/bash

# Function to check if the last command was successful
function check_success {
    if [ $? -ne 0 ]; then
        echo "An error occurred. Exiting."
        exit 1
    fi
}

# Get the current date and time
current_time=$(date +"%Y-%m-%d %H:%M:%S")

# Create a Timeshift snapshot with date and time in the comment
echo "***NOT WORKING YET***Creating Snapper snapshot..."
# CODE GOES HERE
check_success
echo "***WORK IN PROGRESS***Snapper snapshot created successfully."

# Update package lists
echo "Upgrading packages..."
sudo dnf upgrade --refresh -y
check_success

# Upgrade packages
echo "Upgrading flatpak packages..."
flatpak update -y
check_success

read -p "Would you like to upgrade your firmware? (y/n) " response
if [[ "$response" =~ ^[Yy]$ ]]; then
    fwupdmgr refresh
    fwupdmgr get-updates
    fwupdmgr update
else
    echo "Moving on.."
fi

echo "System upgrade completed successfully."
