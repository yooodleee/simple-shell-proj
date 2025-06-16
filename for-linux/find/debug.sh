#!/bin/bash


echo "디버그 관련 옵션"
echo "======================="


echo "-D help 옵션을 사용하는 경우"
# 디버깅 옵션 종류와 설명을 볼 수 있음
find -D help


echo "-D tree 옵션을 사용하는 경우"
# 표현식 트리를 보여줌
find -D tree ./ -name 'e*'


echo "-D search 옵션을 사용하는 경우"
# 검색 과정을 보여줌
find -D search ./ -name 'e*' -exec ls -l '{}' \;


echo "-D stat 옵션을 사용하는 경우"
# stat 시스템 호출이 일어난 경우 보여줌
find -D stat ./ -perm 600 -name 'e*'


echo "-D rates 옵션을 사용하는 경우"
# 표현식 성공률을 요약해서 보여줌
find -D rates ./ -perm 600 -name 'e*'


echo "-D opt 옵션을 사용하는 경우"
# 표현식 실행 순서가 어떻게 최적화되어 실행되는지를 보여줌
find -01 -D opt ./ -perm 600 -name 'e*'