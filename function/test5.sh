#!/bin/bash

function add_all {
    local result=0

    for num in $@
    do
      result=$(($result + $num))
    done

    echo $result
}

result=$(add_all 1 2 3 4 5)
echo "result: $result"