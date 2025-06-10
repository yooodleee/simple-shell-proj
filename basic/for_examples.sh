#!/bin/bash

echo "default for example"

# 1. loop list
for fruit in apple banana orange; do
  echo "frut: $fruit"
done

echo

# 2. number range loop (seq)
for i in $(seq 1 5); do
  echo "number: $i"
done

echo 

# C style for 
for ((i=0; i<5; i++)); do
  echo "C style loop: $i"
done

echo 

# 4. array loop
colors=("red", "green", "blue")

for color in "${colors[@]}"; do
  echo "color: $color"
done

# 5. directory files 
echo "current directory file list:"
for file in *; do
  echo "file: $file"
done

for i in {1..10}; do
  if (( i % 2 == 0 )); then
    echo "$i is even number."
  else
    echo "$i is odd number."
  fi
done