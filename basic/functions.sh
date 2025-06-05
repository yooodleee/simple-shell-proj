#!/bin/bash

# This script demonstrates how to define and call functions in Bash

# Define a simple function without parameters
greet() {
    echo "Hello from the greet function!"
}

# Define a function with parameters
greet_user() {
    local name=$1
    echo "Hello, $name!"
}

# Define a function that returns a value (via echo)
add_numbers() {
    local sum=$(( $1 + $2 ))
    echo $sum
}

# -- Function Calls --

echo "Calling greet:"
greet

echo ""
echo "Calling greet_user with 'yooodleee':"
greet_user "yooodleee"

echo ""
echo "Calling add_numbers with 5 and 7:"
result=$(add_numbers 5 7)
echo "Result of addition: $result"