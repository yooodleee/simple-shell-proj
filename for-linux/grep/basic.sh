#!/bin/bash

echo "grep 기본 사용법 1"
grep -i 'uuid' /etc/fstab

echo "grep 기본 사용법 2"
grep -i -e "^\[[[:alnum:]]*\]" /etc/nova/nova.conf

echo "============================="
echo "패턴을 사용할 경우"

echo "virt_type으로 시작하는 문자열 검색"
grep -i -e "^\[[[:alnum:]]*\]" -e "^virt_type" /etc/nova/nova.conf

echo "============================="
echo "파일을 사용할 경우"

echo "페턴이 저장되어 있는 파일을 이용한 검색"
echo "^\[[[:alnum:]]*\]" > pattern1.txt
grep -i -f pattern1.txt /etc/nova/nova.conf

echo "패턴이 저장되어 있는 여러 파일 검색"
echo "^virt_type" > pattern2.txt
grep -i -f pattern.txt -f pattern2.txt /etc/nova/nova.conf