#!/bin/bash

echo "출력 라인 제어 관련 옵션"
echo "======================="

echo "-b, --byte-offset 옵션을 사용하는 경우"
echo "각 라인 앞에 바이트 수를 함께 보여줌"
grep -b 'express' expression.txt

echo "-H, --with-filename 옵션을 사용하는 경우"
echo "-H 옵션 없이 검색했을 경우 파일명을 보여주지 않음"
grep 'express' expression.txt

echo "-H 옵션으로 검색했을 경우 각 라인 앞에 파일명을 함께 보여줌"
grep -H 'express' expression.txt

echo "-h, --np-filename 옵션을 사용하는 경우"
echo "디렉터리 내 모든 파일에서 패턴을 검색할 경우 파일명을 함께 보여줌"
grep 'express' ./*

echo "-h 옵션을 사용하여 파일명을 제거하고, 검색 결과만 보여줌"
grep -h 'express' ./*

echo "--label=LABEL 옵션을 사용하는 경우"
echo "검색된 파일 정보 앞에 file이라는 라벨을 붙여줌"
ls -l | grep --label=file -H express

echo "-n, --line-number 옵션을 사용하는 경우"
echo "-n 옵션을 사용하여 라인 번호 출력"
grep -n 'question' expression.txt

echo "-T, --initial-tab 옵션을 사용하는 경우"
echo "-T 옵션을 이용하여 라인 번호 간격을 주므로 가독성을 높임"
grep -T -n 'question' expression.txt

echo "-u, --unix-byte-offsets 옵션을 사용하는 경우"
echo "라인 앞에 바이트 수를 보여줌"
grep -u -b 'question' expression.txt

echo "-Z, --null 옵션을 사용하는 경우"
echo "테스트를 위한 expression.txt를 test.txt로 복사"
cp expression.txt test.txt

echo "express라는 패턴을 현재 디렉터리에서 -Z -l 옵션과 함께 검색하면 파일명을 한 줄로 보여줌"
grep -Z -l 'express' ./*