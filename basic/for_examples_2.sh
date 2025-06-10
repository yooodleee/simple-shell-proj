#!/bin/bash

for num in 1 2 3
do
  echo $num;
done

numbers="1 2 3"
for num in $numbers
do
  echo $num;
done

for file in $HOME/*
do
  echo $file;
done

for num in {1..5}
do
  echo $num;
done

for num in {1..10..2}
do
  echo $num;
done

array=("apple", "banana", "pineapple")
for fruit in ${array[@]}
do
  echo $fruit;
done

for ((num=0; num<3; num++))
do
  echo $num;
done