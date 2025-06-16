#!/bin/bash 


echo "심볼릭 링크 관련 옵션"
echo "======================="


echo "-P 옵션을 사용하는 경우"
find -P ./ -type f -name 'e*'


echo "-L 옵션을 사용하는 경우"
# 타입이 파일이고 e로 시작하는 파일 검색
find -L ./ -type f -name 'e*'
# file 명령어를 이용하여 express.txt 파일 속성 확인
file ./File/express.txt


echo "-H 옵션을 사용하는 경우"
find -H ./ -name 'e*' -exec grep CPU '{}' \;

