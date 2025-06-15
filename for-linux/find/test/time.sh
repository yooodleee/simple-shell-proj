#!/bin/bash

echo "시간 관련 테스트"

# git을 이용한 예제 파일 다운로드
git clone https://github.com/naleeJang/Easy-Shell-Script.git
# 예제 파일 압축 해제
tar xvf Easy-Shell-Script/04.Find/Script.tar
# Script 디렉터리로 전환
cd Script
# 디렉터리 파일 목록 확인
ls -l

echo "-admin n 테스트를 사용하는 경우"
# 현재 시각 확인
date
# 1분 내에 접근한 파일 검색
find ./ -admin 1
# 해당 파일의 접근 시각 확인
stat admin.txt | grep Access

echo "-atime n 테스트를 사용하는 경우"
# 현재 시각 확인
date
# 1x24 시간 전에 변경된 파일 검색
find ./ -atime 1

