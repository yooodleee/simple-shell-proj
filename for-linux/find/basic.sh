#!/bin/bash

echo "find 기본 사용법 1"
find /etc -name chrony.conf

echo "find 기본 사용법 2"
# 파일 권한이 664이면서 rc로 시작하는 파일 검색
find -L /etc -perm 664 -name 'rc.*'

# /etc/rc.local은 심볼릭 링크로 링크 권한은 777
ls -l /etc/rc.local

# /etc/rc.d/rc.local의 파일 권한은 664
ls -l /etc/rc.d/rc.local