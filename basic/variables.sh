#!/bin/bash

# This script demonstrates how to declare and use variables in Bash

# Declare variables
name="yoodleee"
age=25
current_year=$(date +%Y)

# Use variables
echo "Name: $name"
echo "Age: $age"
echo "Current Year: $current_year"

# Perform simple arithmetic
birth_year=$((current_year - age))
echo "$name was born in $birth_year."

# Update a variable
name="Bob"
echo "Update name: $name"