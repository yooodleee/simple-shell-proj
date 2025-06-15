#!/bin/bash

echo "그룹 및 사용자 관련 테스트"
echo "======================="

echo "-gid n 테스트를 사용하는 경우"
# 테스트를 위해 root 권한으로 파일 생성
sudo touch rootfile
# 그룹 ID가 0(*0은 root를 의미함)인 파일 검색
find ./ -gid 0
# rootfile의 파일 소유권 확인
ls -l rootfile

echo "-group gname 테스트를 사용하는 경우"
# 그룹 소유권이 root인 파일 검색
find ./ -group root

echo "-nogroup 테스트를 사용하는 경우"
# 테스트를 위해 chonw을 이용해 존재하지 않는 사용자 ID 및 그룹 ID로 소유권 변경
sudo chown 1001:1001 findtestfile
# 존재하지 않는 그룹 ID가 있는 파일 검색
find ./ -nogroup

echo "-nouser 테스트를 사용하는 경우"
# 존재하지 않는 사용자 ID가 있는 파일 검색
find ./ -nouser

echo "-uid n 테스트를 사용하는 경우"
# root 계정 ID를 가지고 있는 파일 검색
find ./ -uid 0

echo "-user uname 테스트를 사용하는 경우"
# root가 소유자인 파일 검색
find ./ -user root

