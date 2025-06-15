#!/bin/bash

echo "기타 테스트"
echo "======================="


echo "-true 테스트를 사용하는 경우"
# 결과값이 항상 true여서 결과값 그대로 출력
find ./File/ -true -name file*.txt


echo "-false 테스트를 사용하는 경우"
# 결과값이 항상 false여서 검색된 파일이 없다고 처리
find ./File/ -false -name file*.txt


echo "-empty 테스트를 사용하는 경우"
# 파일 사이즈가 0인 파일 검색
find ./ -empty


echo "-size n[cwbkMG] 테스트를 사용하는 경우"
# 파일 사이즈가 65K인 파일 검색
find ./ -size 65k