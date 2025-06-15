#!/bin/bash

echo "파일명 관련 테스트"
echo "======================="

echo "-iname pattern 테스트를 사용하는 경우"
# 테스트를 위한 파일명 변경
mv expression.txt Expression.txt
# e로 시작하는 txt 파일 검색
find ./ -iname 'e*.txt'

echo "-inum n 테스트를 사용하는 경우"
# 테스트로 인해 변경한 파일명을 원파일명으로 변경
mv Expression.txt expression.txt
# 테스틀ㄹ 위한 Inode를 검색
stat expression.txt | grep -i inode
# Inode가 269084002인 파일 검색
find ./ -inum 269084002

echo "-lname pattern 테스트를 사용하는 경우"
# 확장자가 txt로 끝나면 심볼릭 링크 검색
find ./ -lname '*.txt'
# express.txt 파일 속성 확인
ls -l ./File/express.txt

echo "-name pattern 테스트를 사용하는 경우"
# e로 시작하는 txt 파일 검색
find ./ -name 'e*.txt'

echo "-regex pattern 테스트를 사용하는 경우"
# f와 e가 순서대로 포함된 경로 검색
find ./ -regex '.*f*e'

echo "-iregex pattern 테스트를 사용하는 경우"
# -regex로 검색했을 경우
find -regex '.*s.*t'
# -iregex로 검색했을 경우 Separator.txt가 더 검색되었음
find -iregex '.*s.*t'

echo "-samefile name 테스트를 사용하는 경우"
# 파일명과 동일한 Inode를 가지고 있는 파일 검색 - 심볼릭 링크 포함
find -L ./ -samefile expression.txt

