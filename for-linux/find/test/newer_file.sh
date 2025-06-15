#!/bin/bash

echo "최신 파일 관련 테스트"
echo "======================="

echo "-answer file 테스트를 사용하는 경우"
# 테스트를 위해 expression.txt를 cat을 통해 접근
cat expression.txt
# amin.txt보다 더 최근에 수정된 파일 검색
find ./ -answer amin.txt

echo "-cnwer file 테스트를 사용하는 경우"
# 테스트를 위해 Separator.txt에 문자열 추가
echo "cnewer test" >> Separator.txt
# amin.txt보다 최근에 변경된 파일 검색
find -L ./ -cnewer amin.txt

echo "-newer file 테스트를 사용하는 경우"
# amin.txt보다 최근에 수정된 파일 검색
find ./ -newer amin.txt

echo "-newerXY file 테스트를 사용하는 경우"
# amin.txt보다 더 최근에 수정되고, 변경된 파일 검색
find ./ -newercm amin.txt

