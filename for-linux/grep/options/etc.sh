#!/bin/bash

echo "기타 옵션"
echo "======================="

echo "--line-buffered 옵션을 사용하는 경우"
echo "--line-buffered 옵션은 일반적으로 양이 많은 로그 파일 등을 검색할 때 사용함"
sudo grep --line-buffered -i -r 'error' /var/log/*

echo "-U, --binary 옵션을 사용하는 경우"
echo "-U 옵션을 사용하여 CPU 검색"
grep -U 'CPU' expression.txt

echo "-z, --null-data 옵션을 사용하는 경우"
echo "파일 내용 안에서 특정 문자열 검색"
grep -z 'CPU' ./*.txt
