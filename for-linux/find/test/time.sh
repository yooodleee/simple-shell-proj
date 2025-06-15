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