#!/bin/bash

function test {
    echo "test will return 12"
    return 12
}

test
echo "return value of test: $?"