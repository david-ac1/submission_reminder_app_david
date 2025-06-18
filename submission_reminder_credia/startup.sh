#!/bin/bash

# Load environment and functions
source ./config/config.env
source ./modules/functions.sh

echo "--------------------------------------------"
echo "Welcome to the Submission Reminder App!"
echo "Assignment: $ASSIGNMENT"
echo "Days remaining: $DAYS_REMAINING"
echo "--------------------------------------------"

# Run the reminder
./app/reminder.sh
