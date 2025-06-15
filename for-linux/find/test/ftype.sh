#!/bin/bash

echo "파일 타입 관련 테스트"
echo "======================="


echo "-type c 테스트를 사용하는 경우"
# 파일 타입이 심볼릭 링크인 파일을 검색
find ./ -type l


echo "-xtype c 테스트를 사용하는 경우"
# 디렉터리만 검색
find ./ -xtype d
# -xtype 옵션으로 심볼릭 링크 검색 시 -L 옵션을 함께 사용해야 함
find -L / -xtype l


echo "-context pattern 테스트를 사용하는 경우"
# 파일의 보안 컨텍스트 정보를 확인
ls -lZ File/
# user_home_t가 포함된 파일 검색
find ./File -context '*user_home_t*'