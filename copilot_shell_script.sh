#!/bin/bash

# Ask user for the project folder name 
read -p "Enter the project folder name : " PROJECT_FOLDER

CONFIG_FILE="$PROJECT_FOLDER/config/config.env"

if [ ! -f "$CONFIG_FILE" ]; then
    echo "Error: $CONFIG_FILE not found. Please make sure the folder name is correct and you are running this script from the directory containing the project folders."
    exit 1
fi

# Ask for new assignment name here
read -p "Enter the new assignment name: " NEW_ASSIGNMENT

# Update the ASSIGNMENT line in config.env
sed -i "2s/^ASSIGNMENT=.*/ASSIGNMENT=\"$NEW_ASSIGNMENT\"/" "$CONFIG_FILE"

if [ $? -eq 0 ]; then
    echo "Assignment updated to '$NEW_ASSIGNMENT' in $CONFIG_FILE"
else
    echo "Failed to update the assignment in $CONFIG_FILE"
    exit 1
fi

# Run startup.sh inside the designated project folder
STARTUP_SCRIPT="$PROJECT_FOLDER/startup.sh"

if [ -x "$STARTUP_SCRIPT" ]; then
    echo "Running startup.sh to show updated submission reminders..."
    cd "$PROJECT_FOLDER" || exit
    ./startup.sh
else
    echo "Error: startup.sh not found or not executable in $PROJECT_FOLDER."
    exit 1
fi
