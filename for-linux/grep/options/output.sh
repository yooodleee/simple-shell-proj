#!/bin/bash

echo "출력 제어 관련 옵션"
echo "======================"

echo "-c, --count 옵션을 사용하는 경우"
echo "expression과 일치하는 문자열 개수 출력"
grep -c 'expression' expression.txt

echo "--color 옵션을 사용하는 경우"
echo "검색한 문자열을 연두색으로 보여주도록 설정"
GREP_COLOR="1;32" grep --color 'expression' expression.txt

echo "-L, --files-without-match 옵션을 사용하는 경우"
echo "파일 목록 확인"
ls

echo "패턴이 포함되어 있지 않은 파일 목록 검색"
grep -L 'express' ./*

echo "-l, --files-with-matches 옵션을 사용하는 경우"
echo "패턴이 포함된 파일 목록 검색"
grep -l 'express' ./*

echo "-m 라인 수, --max-count=라인 수 옵션을 사용하는 경우"
echo "검색 라인을 5줄만 출력"
grep -m 5 "^\[[[:lower:]]*\]" /etc/nova/nova.conf

echo "-o, --only-matching 옵션을 사용하는 경우"
echo "express로 시작하고 영문소문자로 끝나는 단어 검색"
grep -o "express[[[:lower:]]*]" expression.txt

echo "-q, -quiet, --silent 옵션을 사용하는 경우"
echo "-q를 사용하지 않고 검색하면 검색 결과를 보여줌"
grep 'help' expression.txt

echo "-q 옵션을 사용하면 검색 결과를 보여주지 않음"
grep -q 'help' expression.txt

echo "-s, --no-messages 옵션을 사용하는 경우"
echo "-s 옵션 없이 존재하지 않는 파일명에서 패턴을 검색한 경우 에러 메시지를 보여줌"
grep 'help' express.txt

echo "-s 옵션 사용 시 존재하지 않는 파일명에서 패턴을 검색해도 에러 메시지를 보야주지 않음"
grep -s 'help' express.txt

