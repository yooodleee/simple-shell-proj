#!/bin/bash


echo "sed 스크립트 | address commands"
echo "======================="


echo ":label, #comment, {...}, = command를 사용할 경우"
# # Test로 시작하는 라인부터 +3라인까지의 라인 번호 출력
cat sed-script.txt
# 파일을 이용하여 sed 실행
sed -n -f sed-script.txt hosts


echo "a \text command를 사용할 경우"
# 172.10.2.13이 있는 라인에 새 주소 172.10.2.14 추가
sed -n '/172.10.2.13/ { a \ 172.10.2.14 test3.example.com p }' hosts


echo "i \text command를 사용할 경우"
# 172.10.2.13에 있는 라인 위에 새 주소 172.10.2.14 추가
sed -n '/172.10.2.13/ { i \ 172.10.2.14 test3.example.com p }' hosts


echo "q command를 사용할 경우"
# test2.example.com을 출력하지 않고 종료
sed -n '/172.10.2.13/ { a \ 172.10.2.14 test3.example.com q p }' hosts


echo "Q command를 사용할 경우"
# 아무것도 출력하지 않고 종료
sed -n '/172.10.2.13/ { a \ 172.10.2.14 test3.example.com Q p }' hosts


echo "r 파일명 command를 사용할 경우"
# 새 IP 주소를 sed-read.txt 파일에 저장
cat sed-read.txt
# 172.10.2.13 라인 뒤에 파일의 모든 새 IP 추가
sed -n '/172.10.2.13/ { r sed-read.txt p }' hosts


echo "R 파일명 command를 사용할 경우"
# 172.10.2.13 라인 뒤에 파일의 첫 번째 새 IP만 추가
sed -n '/172.10.2.13/ { R sed-read.txt p }' hosts

