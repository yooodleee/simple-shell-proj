#!/bin/bash

echo "grep 기본 사용법 1"
grep -i 'uuid' /etc/fstab

echo "grep 기본 사용법 2"
grep -i -e "^\[[[:alnum:]]*\]" /etc/nova/nova.conf

echo "virt_type으로 시작하는 문자열 검색"
grep -i -e "^\[[[:alnum:]]*\]" -e "^virt_type" /etc/nova/nova.conf