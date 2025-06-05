#!/bin/bash

# This script creates directories

# Define directory names
dir1="project"
dir2="project/logs"
dir3="project/data"

# Create directories
echo "Creating directories..."

mkdir -p "$dir1"
mkdir -p "$dir2"
mkdir -p "$dir3"

echo "Directories created:"
echo "- $dir1"
echo "- $dir2"
echo "- $dir3"

# Check if a directory exists
if [ -d "$dir1" ]; then
  echo "Directory '$dir1' exists."
else
  echo "Failed to create '$dir1'."
fi