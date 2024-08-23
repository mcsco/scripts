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
echo "Creating Timeshift snapshot..."
sudo timeshift --create --comments "Pre-upgrade snapshot taken on $current_time" --tags D
check_success
echo "Snapshot created successfully."

# Update package lists
echo "Updating package lists..."
sudo apt update
check_success

# Upgrade packages
echo "Upgrading packages..."
sudo apt upgrade -y
check_success

# Upgrade packages
echo "Upgrading flatpak packages..."
flatpak update -y
check_success

echo "System upgrade completed successfully."
