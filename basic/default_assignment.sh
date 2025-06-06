#!/bin/bash

echo "===================================================="
echo "comparison variable's default assignment example"
echo "===================================================="

# not declare variable (unset state)
unset VAR1
unset VAR2

echo "1. ${VAR1:-default} use (no insert)"
echo "Result: ${VAR1:-defualt}"
echo "VAR1: '${VAR1}' (maintain original value)"

echo 
echo "2. ${VAR2:=default} use (no value no insert)"
echo "Result: ${VAR2:=default}"
echo "VAR2: '${VAR2}' (insert to value)"

echo
echo "============================================"
echo "compare with after using"
echo "============================================"

echo "VAR1 reuse (:-default): ${VAR1:-new_value}"
echo "VAR1 maintain: '${VAR1}'"

echo
echo "VAR2 reuse (:-new_value): ${VAR2:-new_value}"
echo "VAR2 maintain: '${VAR2}'"

echo
echo "============================================"
echo "Default File Path"
echo "============================================"

unset FILE_PATH
echo "FILE_PATH initial state: '${FILE_PATH}'"

echo "Set File's Path..."
FILE_PATH=${FILE_PATH:=/tmp/default.log}
echo "use path: $FILE_PATH"
