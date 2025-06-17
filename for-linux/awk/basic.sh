#!/bin/bash


echo "awk 사용법"
echo "======================="


echo "awk 기본 사용법 1"
# Script 디렉터리 내 파일 목록을 file-list.txt에 저장
ls -al Script/ > file-list.txt
# 두 번째 필드 값이 2인 레코드의 문자열 출력
awk '$2 == 2 { print $NF }' file-list.txt


echo "awk 기본 사용법 2"
# 패턴과 액션을 awk-prog.txt 파일에 저장
echo '$2 == 2 { print $NF }' > awk-prog.txt
# awk-prog.txt 파일을 이용하여 디렉터리 명 추출
awk -f awk-prog.txt file-list.txt


echo "awk 기본 사용법 3"
# ls -l 실행 결과를 인자로 awk를 이용하여 디렉터리 명 추출
ls -l Script/ | awk '$2 == 2 { print $NF }'