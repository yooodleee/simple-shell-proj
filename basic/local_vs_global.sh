#!/bin/bash

# Global variable
message="This is a global variable"

# Function using a local variable
use_local_variable() {
    local message="This is a local variable inside the function"
    echo "[Inside use_local_variable] message = $message"
}

# Function modifying the global variable
modify_global_variable() {
    message="The global variable has been modified"
    echo "[Inside modify_global_variable] message = $message"
}

# === Main Script ===

echo "[Before any function call] message = $message"

echo ""
use_local_variable

echo ""
echo "[After use_local_varialbe] message = $message"

echo ""
modify_global_variable

echo ""
echo "[After modify_global_variable] message = $message"