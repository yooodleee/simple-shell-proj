#!/bin/bash

echo "매칭 제어 관련 옵션"
echo "======================="

echo "-e, --regexp 패턴을 사용할 경우"
echo "mail과 phone이라는 단어가 포함된 라인 검색"
grep -e 'mail' --regexp 'phone' expression.txt

echo "-f, --file=파일 옵션을 사용할 경우"
echo "echo를 이용해 mail과 phone을 파일로 저장"
echo 'mail' > file1.txt
echo 'phone' > file2.txt

echo "저장한 파일을 이용해 expression.txt에서 mail과 phone이 포함된 문자열 검색"
grep -f file1.txt --file=file2.txt expression.txt

echo "-i, --ingore-case 옵션을 사용하는 경우"
echo "대소문자 구분 없이 expression 검색"
grep -i 'expression' expression.txt

echo "-v, --invert-match 옵션을 사용할 경우"
echo "주석과 공백을 제외한 파일 내용 확인"
cat expression.txt | grep -v '^#' | grep -v '^$'

echo "-w, --word-regexp 옵션을 사용할 경우"
echo "-w 옵션 없이 검색했을 경우 expression이 포함된 모든 라인 출력"
grep 'expression' expression.txt

echo "-w 옵션을 사용했을 경우 expression과 일치하는 단어가 있는 라인만 출력"
grep -w 'expression' expression.txt

echo "-x, --line-regexp 옵션을 사용할 경우"
echo "일부만 일치할 경우에는 결과가 없음"
grep -x 'Help' expression.txt

echo "라인 전체가 일치할 경우에만 결과를 보여줌"
grep -x '# Help' expression.txt

echo "-y 옵션을 사용할 경우"
echo "대소문자 구분 없이 expression 검색"
grep -y 'expression' expression.txt
