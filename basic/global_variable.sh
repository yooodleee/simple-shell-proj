#!/bin/bash

# This script demonstrates how to use global variables in Bash

# Define a global variable
counter=0

# Function to print the global counter
print_counter() {
    echo "Current counter value: $counter"
}

# Function to increment the global counter
increment_counter() {
    counter=$((counter + 1))
    echo "Counter incremented to: $counter"
}

# Function to reset the global counter
reset_counter() {
    counter=0
    echo "Counter has been reset."
}

# == Main Script ==

echo "Initial value:"
print_counter

echo ""
echo "Incrementing..."
increment_counter

echo ""
echo "Incrementing again..."
increment_counter

echo ""
echo "Resetting..."
reset_counter

echo ""
echo "Final value:"
print_counter