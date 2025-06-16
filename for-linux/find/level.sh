#!/bin/bash


echo "레벨 관련 옵션"
echo "======================="


echo "-O0 옵션을 사용하는 경우"
# 파일 권한, 파일명 순서로 검색하면 파일명, 권한 순서로 변경됨을 알 수 있음
find -O0 -D opt ./ -perm 600 -name 'e*'


echo "-O1 옵션을 사용하는 경우"
# 파일 권한, 파일명 순서로 검색하면 파일명, 권한 순서로 변경됨을 알 수 있음
find -O1 -D opt ./ -perm 600 -name 'e*'


echo "-O2 옵션을 사용하는 경우"
# 파일명을 찾고 그 다음 단계로 넘어감
find -O1 -D opt ./ -type l -name 'e*'
# 파일명을 찾고 바로 이어 파일 타입을 평가한 후 그 다음 단계로 넘어감
find -O2 -D opt ./ -type \ -name 'e*'


echo "-O3 옵션을 사용하는 경우"
# -a 연산자일 경우 평가율이 0.08임
find -O3 -D opt ./ -type l -a -name 'e*'
# -o의 경우 평가율이 0.9임
find -O3 -D opt ./ -type l -o -name 'e*'