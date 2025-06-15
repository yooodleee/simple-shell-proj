#!/bin/bash

echo "파일 권한 관련 테스트"
echo "======================="

# 테스트를 위한 에제 파일 권한 변경
ls -l

echo "-perm mode 테스트를 사용하는 경우"
# 파일 권한이 660인 파일 검색
find ./ -perm 660

echo "-perm -mode 테스트를 사용하는 경우"
# 파일 권한이 666인 파일 검색
find ./ -perm 666
# 파일 권한이 666을 포함한 파일 검색
find ./ -perm 666
# File 디렉터리 내의 express.txt 파일 확인
ls -l ./File/express.txt

echo "-perm/mode 테스트를 사용하는 경우"
# 파일 권한 중 하나 이상이 6에 해당하는 파일 검색
find ./ -perm /666

echo "-readable 테스트를 사용하는 경우"
# 테스트를 위해 root 계정에서 /temp 디렉터리에 파일 생성
mkdir /temp; touch /temp/read.txt
# 이전 계정으로 전환하고 temp 디렉터리로 이동 후 읽기가 가능한 파일 검색
find ./ -readable

echo "-writable 테스트를 사용하는 경우"
# temp 디렉터리에 쓰기가 가능한 파일 검색
find ./ -writable
# temp 디렉터리의 파일 목록 확인 시 쓰기 권한이 없음을 확인
ls -l

echo "-executable 테스트를 사용하는 경우"
# yooodleee 계정이 실행할 수 있는 파일 검색
find ./ -executable