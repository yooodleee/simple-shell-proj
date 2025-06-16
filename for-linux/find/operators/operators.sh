#!/bin/bash

echo "연산자"
echo "======================="


echo "파일 목록 확인"
# 파일 목록 확인
ls -l


echo "(expr) 연산자를 사용하는 경우"
# ()를 사용할 경우 \와 함께 사용해야 함.
find ./ \( -name 'exp*' \)


echo "!expr 연산자를 사용하는 경우"
# 파일명이 txt로 끝나지 않는 파일명 검색
find ./ ! -name '*.txt'


echo "-not expr 연산자를 사용하는 경우"
# 파일명이 txt로 끝나지 않는 파일명 검색
find ./ -not -name '*.txt'


echo "expr1 expr2 연산자를 사용하는 경우"
# 파일 타입이 디렉터리이면서 이름이 p로 시작되는 경로 검색
find ./ -type d -name 'p*'
# 파일 타입이 파일이면서 이름이 p로 시작되는 경로 검색
find ./ -type f -name 'p*'


echo "expr1 -a expr2 연산자를 사용하는 경우"
# 파일 타입이 파일이면서 이름이 p로 시작되는 경로 검색
find ./ -type f -a -name 'p*'


echo "expr1 -and expr2 연산자를 사용하는 경우"
# 파일 사이즈가 65k이며, 이름이 a로 시작되는 파일 검색
find ./ -size 65k -and -name 'a*'


echo "expr1 -o expr2 연산자를 사용하는 경우"
# 파일 사이즈가 64k이거나, 파일명이 r로 시작되는 파일 검색
find ./ -size 65k -o -name 'r*'


echo "expr1 -or expr2 연산자를 사용하는 경우"
# 실행 권한을 가졌거나, 이름이 r로 시작되는 파일 경로 검색
find ./ -executable -or -name 'r*'


echo "expr1, expr2 연산자를 사용하는 경우"
# 파일명이 a로 시작되는 파일과 b로 시작되는 파일 검색
find ./ -name 'a*' , -name 'b*'
# 파일명이 a로 시작되는 파일과 b로 시작된느 파일 검색
find ./ \( -name 'a*' -printf '%p\n' \), \( -name 'b*' -printf '%p\n' \)