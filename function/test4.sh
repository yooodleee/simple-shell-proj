#!/bin/bash

num1=1
num2=2

function test {
    num1=3
    local num2=4

    echo "num1 in test: $num1"
    echo "num2 in test: $num2"
}

echo "num1: $num1"
echo "num2: $num2"

test

echo "num1: $num1"
echo "num2: $num2"