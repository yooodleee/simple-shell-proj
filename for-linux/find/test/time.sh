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
stat amin.txt | grep Access

echo "-atime n 테스트를 사용하는 경우"
# 현재 시각 확인
date
# 1x24 시간 전에 변경된 파일 검색
find ./ -atime 1

echo "-cmin n 테스트를 사용하는 경우"
# 현재 시각 확인
date
# 테스트를 위해 파일 권한 추가
chmod o+w amin.txt
# 1분 이내에 상태가 변경된 파일 검색
find ./ -cmin 1
# 파일 변경 상태 확인
stat amin.txt | grep Change

echo "-ctime n 테스트를 사용하는 경우"
# 현재 시각 확인
date
# 24시간 내에 수정된 파일 검색
find ./ -ctime 0

echo "-mmin n 테스트를 사용하는 경우"
# 현재 시각 확인
date
# 15분 전에 수정된 파일 검색
find ./ -mmin 15
# 파일 수정 시간 확인
stat amin.txt | grep Modify

echo "-mtime n 테스트를 사용하는 경우"
# 현재 시각 확인
date
# 24시간 내에 수정된 파일 검색
find ./ -mtime 0

