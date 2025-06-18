#!/bin/bash

# Ask for new assignment
read -p "Enter the new assignment name: " new_assignment

read -p "Enter the name of the environment that you wish to update: " env

# Escape input for sed
escaped_assignment=$(printf '%s\n' "$new_assignment" | sed 's/[&/\]/\\&/g')

# Update the ASSIGNMENT value
sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=\"$escaped_assignment\"/" ./$env/config/config.env


echo "The selected environment, $env, has been updated"
