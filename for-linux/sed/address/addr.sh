#!/bin/bash


echo "sed 스크립트 | Address"
echo "======================="


echo "sed 테스트를 위한 예제 파일 준비"
# git을 이용한 예제 파일 다운로드
git clone https://github.com/naleeJang/Easy-Shell-Script.git
# 예제 파일 복사를 위한 디렉터리 생성
mkdir sed
# Easy-Shell-Script/5.Awk 디렉터리 내의 모든 파일을 awk 디렉터리로 복사
cp Easy-Shell-Script/6.Sed/* sed/
# sed 디렉터리로 전환
cd sed
# sed 테스트를 위한 샘플 파일 내용
cat hosts


echo "number address를 사용할 경우"
# 5번째 줄을 출력함
sed -n '5 p' hosts


echo "first~step address를 사용할 경우"
# 1번째 라인부터 시작하여 3라인마다 해당 라인 번호 출력
sed  -n '1~3 =' hosts


echo "$ address를 사용할 경우"
# 파일의 마지막 라인 번호 출력
sed -n '$ =' hosts
# 파일의 마지막 라인 문자열 출력
sed -n '$ p' hosts


echo "/regexp/ address를 사용할 경우"
# test와 숫자로 시작하는 문자열이 포함된 라인 출력
sed -n '/test[0-9].*/ p' hosts


echo "\cregexpc address를 사용할 경우"
# test와 숫자로 시작하는 문자열이 포함된 라인 출력
sed -n '\ctest[0-9].*c p' hosts


echo "0.addr2 address를 사용할 경우"
# 1번째 라인부터 #Devel로 시작하는 문자열이 있는 라인까지 출력
sed -n '0./^# Devel*/ p' hosts


echo "add1,+N address를 사용할 경우"
# # Devel로 시작하는 라인부터 아래 3줄까지 출력
sed -n '/^# Devel*/,+3 p' hosts


echo "add1,~N address를 사용할 경우"
# # Devel이 포함된 라인을 기준으로 3번째 라인까지 출력
sed -n '/^# Devel*/,~3 p' hosts