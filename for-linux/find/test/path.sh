#!/bin/bash

echo "파일 경로 관련 테스트"
echo "======================="


echo "-ipath pattern 테스트를 사용하는 경우"
# f로 시작해 t로 끝나는 경로의 모든 파일 검색
find ./ -ipath './f*t'


echo "-iwholename pattern 테스트를 사용하는 경우"
find ./ -iwholename './f*t'


echo "-links n 테스트를 사용하는 경우"
# 2개의 링크를 가지고 있는 경로 검색
find ./ -links 2


echo "-path pattern 테스트를 사용하는 경우"
# pa로 시작해서 t로 끝나는 경로 검색
find ./ -path './pa*t'


echo "-wholename pattern 테스트를 사용하는 경우"
# pa로 시작해서 t로 끝나는 경로 검색
find ./ -wholename './pa*t'