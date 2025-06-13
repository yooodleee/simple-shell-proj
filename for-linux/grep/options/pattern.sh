#!/bin/bash

echo "패턴 문법 관련 옵션"
echo "======================="

echo "-E 옵션을 사용할 경우"
echo "-E 옵션 없이 정규 표현식을 사용하여 검색한 경우"
grep 'q[[:lwer:]]*\>>' expression.txt

echo "-E 옵션과 함께 정규 표현식을 사용하여 검색한 경우"
grep -E 'q[[:lower:]]*\??' expression.txt

echo "-F 옵션을 사용할 경우"
grep -F '# Date'

echo "-G 옵션을 사용할 경우"
echo "옵션 없이 정규 표현식을 사용하여 검색한 경우"
grep 'q[[:lower:]]*\??' expression.txt

echo "-G 옵션과 함께 정규 표현식을 사용하여 검색한 경우"
grep -G 'q[[:lower:]]*\??' expression.txt


echo "-P 옵션을 사용할 경우"
echo "======================="

echo "옵션 없이 정규 표현식을 사용하여 검색한 경우"
grep "(?<=\[')[^,]*" /etc/nova/nova.conf

echo "-P 옵션과 함께 정규 표현식을 사용하여 검색한 경우"
grep -P "(?<=\[')[^,]*" /etc/nova/nova.conf
