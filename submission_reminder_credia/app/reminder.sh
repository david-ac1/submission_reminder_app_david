#!/bin/bash

# Source environment and functions
source ./config/config.env
source ./modules/functions.sh

# Submissions file
submissions_file="./assets/submissions.txt"

echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING"
echo "--------------------------------------------"

check_submissions $submissions_file
