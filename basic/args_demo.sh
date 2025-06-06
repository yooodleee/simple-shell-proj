#!/bin/bash

echo "========================="
echo "Positional Parameter"
echo "========================="

echo "Script name: $0"
echo "First args: $1"
echo "Second args: $2"
echo "Third args: $3"
echo "Total args (space index): $@"
echo "Total args: $*"
echo "args num: $#"

echo 
echo "========================="
echo "Args Testing"
echo "========================="

if [ $# -lt 2 ]; then
  echo "최소 2개의 인자가 필요합니다."
  echo "example: $0 <name> <job>"
  exit 1
fi

NAME=$1
JOB=$2

echo "Hello, $NAME!"
echo "Yoor job is $JOB."

echo 
echo "========================="
echo "shift example"
echo "========================="
echo "first \$1: $1"
shift
echo "after shift \$1: $1 (before \$2)"