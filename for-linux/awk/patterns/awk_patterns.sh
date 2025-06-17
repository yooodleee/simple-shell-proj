#!/bin/bash


echo "awk 패턴 프로그래밍"
echo "======================="


echo "awk 테스트를 위한 예제 파일 확인"
# awk 테스트를 위한 첫 번째 샘플 파일
cat awk-sample.txt
# awk 테스트를 위한 두 번째 샘플 파일
cat awk-sample1.txt


echo "BEGIN { 액션 } END { 액션 }을 사용하는 경우"
# awk-sample1.txt의 8번째 필드를 출력하기 전에 "# Filename #" 문구를 출력힘
awk 'BEGIN {print "#Filename #"} {print $8}' awk-sample1.txt
# awk-sample1.txt의 8번째 필드 출력 후 "*The file is NR(레코드 수)"를 출력함
awk '{print $8} END { print "*The file is "NR }' awk-sample1.txt


echo "BEGINFILE { 액션 } ENDFILE { 액션 }을 사용하는 경우"
# 8번째 필드 출력 전 "Start--> 파일명"을 출력하고, 8번째 출력 후 "End--> 파일명"을 출력함
awk 'BEGINFILE { print "Start--> " FILENAME} {print $8} ENDFILE { print "End--> " FILENAME}' awk-sample1.txt


echo "/정규 표현식/을 사용하는 경우"
# 소유자만 읽고 쓰기가 가능한 파일 목록 출력
awk '/^-rw-{7}/ { print }' awk-sample1.txt
# 파일명이 a로 시작해 txt로 끝나는 파일 목록 출력
awk '/a[[:lower:]]*.txt/ { print }' awk-sample1.txt


echo "관계식을 사용하는 경우"
# 2번째 필드 값이 2로, 디렉터리일 경우에만 디렉터리 명 출력
awk '$2 == 2 { print $NF }' awk-sample.txt


echo "패턴1 && 패턴2를 사용하는 경우"
# 레코드 번호가 1이 아니고, 디렉터리인 경우에만 디렉터리 목록 출력
awk 'NR !=1 && $2 == 2 { print }' awk-sample.txt
# 소유가자 읽고 쓸 수 있으며, a와 txt 사이가 영문소문자로 이루어진 파일 목록 출력
awk '/^-rw-*/ && /a[[:lower:]]*.txt/ {print}' awk-sample.txt


echo "패턴1 || 패턴2를 상요하는 경우"
# 파일 소유자가 yooodleee가 아니고, 파일 사이즈가 0인 파일 목록 출력
awk '$3 != "yooodleee" || $4 == 0 { print }' awk-sample.txt


echo "패턴1 ? 패턴2 : 패턴3을 사용하는 경우"
# 2번째 필드값이 2면 Directory를 res에 저장하고, 아니면 File을 res에 저장한 후 
# 파일명은 10칸 내에 맞추고, res 변수값과 뉴라인을 추가하여 출력함
awk '$2 == 2 ? res="Directory" : res="File" { printf "%-10s %s\n", $NF, res }' awk-sample1.txt


echo "(패턴)을 사용하는 경우"
# 6번재 필드(수정일자)가 05-22보다 크거나 같은 경우의 파일 목록 출력
# 관계식을 소괄호로 묶어 가독성을 높이는 데 사용
awk '($6 >= "05-22") { print }' awk-sample.txt


echo "!패턴을 사용하는 경우"
# 파일 소유자가 yooodleee가 아닌 파일 목록 출력
awk '!(/yooodleee/) { print }' awk-sample.txt


echo "패턴1, 패턴2를 사용하는 경우"
# 파일 레코드 번호가 2부터 5까지에 해당하는 파일 목록 출력
awk 'FNR==2, FNR==5 { print }' awk-sample.txt
# 파일 수정일자가 05-20보다 늦고 05-25보다 빠른 일자에 수정한 파일 목록 출력
awk '($6 ? "05-20"), ($6 < "05-25") { print }' awk-sample.txt