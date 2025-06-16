#!/bin/bash

echo "위치 옵션"
echo "======================="


echo "-depth 위치 옵션을 사용하는 경우"
# 현재 디렉터리부터 검색됨을 확인
find ./ -name 'p*'
# 디렉터리부터 검색됨을 확인
find ./ -depth -name 'p*'


echo "-daystart 위치 옵션을 사용하는 경우"
# 현재 시각 확인
date
# 현재 시각을 기준으로 24시간 안에 수정된 파일 검색
find ./ -ctime 0
# 현재 시각을 기준으로 현재 날짜에 수정된 파일 검색
find ./ -daystart -ctime 0
# -daystart 옵션을 사용했을 때 검색된 파일 상태 확인
stat ./Separator.txt | grep Change
# -daystart 옵션을 사용했을 때 검색되지 않은 파일 상태 확인
stat File/ | grep Change


echo "-regextype 위치 옵션을 사용하는 경우"
# posix 형식의 패턴을 사용했을 경우
find ./ -regex './[[:lower:]]*'
# -regextype으로 패턴 타입을 변경했을 경우
find ./ -regextype posix-basic -regex './[[:lower:]]*'


echo "-maxdepth levels 위치 옵션을 사용하는 경우"
# 명시된 깊이까지만 검색됨
find ./ -maxdepth 1 -name 'p*'


echo "-mindepth levels 위치 옵션을 사용하는 경우"
# 명시된 깊이까지만 검색됨
find ./ -mindepth 2 -name 'p*'


echo "-mount 위치 옵션을 사용하는 경우"
# USB 디바이스 마운트됨을 확인
mount | grep test
# 현재 디렉터리의 jpg 파일 확인
ls -l icon_excel.jpg
# -mount 옵션 없이 jpg 파일 검색 시 USB의 jpg 파일도 검색됨
find ./ -name icon_excel.jpg
# -mount 옵션 사용 시 USB의 jpg 파일은 검색이 안 됨
find ./ -mount -name icon_excel.jpg


echo "-warn, -nowarn 위치 옵션을 사용하는 경우"
# -warn에 의해 발생된 경고 메시지
find ./ -name findtestfile -depth -warn
# 경고 메시지가 없어졌음
find ./ -name findtestfile -depth -nowarn


echo "-help 위치 옵션을 사용하는 경우"
# find 사용법 출력
find -help


echo "-version, --version 위치 옵션을 사용하는 경우"
# find 버전 출력
find -version