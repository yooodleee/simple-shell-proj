#!/bin/bash

# comparing variable
name="yooodleee"

if ["$name" = "Alice"]; then
  echo "Hello, Alice!"
else
  echo "You are not Alice"
fi

# check empty variable
empty_var=""

if [ -z "$empty_var" ]; then
  echo "empty_var is empty"
fi

# check number
age=25

if [ "$age" -ge 18 ]; then
  echo "Adult"
else
  echo "Not Adult"
fi

# check file's existance
filename="test.txt"

if [ -f "$filename" ]; then
  echo "$filename is exist."
else
  echo "$filename is not exist. Create new one."
  touch "$filename"
fi

# check directory's existance
dir="./my_folder"

if [ -d "$dir" ]; then
  echo "directory $dir is exist."
else
  echo "directory $dir is not exist. Create new one."
  mkdir "$dir"
fi

# AND condition
user="admin"
status="active"

if [ "$user" = "admin" ] && [ "$status" = "active" ]; then
  echo "Activated admin account."
fi

# OR condition
num=5

if [ "$num" -lt 0 ] || [ "$num" -gt 10 ]; then
  echo "0 > num, 0 < 10"
else
  ehco "0 <= num <= 10"
fi