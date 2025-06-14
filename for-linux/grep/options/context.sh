#!/bin/bash

echo "컨텍스트 라인 제어 관련 옵션"
echo "======================="

echo "-A 라인 수, --after-context=라인 수 옵션을 사용하는 경우"
echo "검색된 라인 아래 2 줄을 더 보여줌"
grep -A 2 'question' expression.txt

echo "-B 라인 수, --before-context=라인 수 옵션을 사용하는 경우"
echo "검색된 라인 위 2 줄을 더 보여줌"
grep -B 2 'question' expression.txt

echo "-C 라인 수, - 라인 수, --context=라인 수 옵션을 사용하는 경우"
echo "검색된 라인 위, 아래 2 줄을 더 보여줌"
grep -C 2 'question' expression.txt

echo "--group-separator=그룹 구분 기호 옵션을 사용하는 경우"
echo "검색된 패턴 라인 위에 그룹 구분 기호 ====== 를 함께 보여줌"
grep -A 1 --group-separator='=======' '# [[:alpha:]]'

echo "--no-group-separator 옵션을 사용하는 경우"
echo "기본 그룹 구분 기호인 --를 함께 보여줌"
grep -A 1 '# [[:alpha:]]' expression.txt

echo "그룹 구분 기호 없이 검색 결과를 보여줌"
grep -A 1 --no-group-separator '# [[:alpha:]]' expression.txt