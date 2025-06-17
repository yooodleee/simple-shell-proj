#!/bin/bash


echo "awk 액션 프로그래밍"
echo "======================="


echo "awk 테스트를 위한 파일 준비"
# git을 이용한 예제 파일 다운로드
git clone https://github.com/naleeJang/Easy-Shell-Script.git
# 예제 파일 복사를 위한 디렉터리 생성
mkdir awk
# Easy-Shell-Script/5.Awk 디렉터리 내의 모든 파일을 awk 디렉터리로 복사
cp Easy-Shell-Script/5.Awk/* awk/
# awk 디렉터리로 전환
cd awk


# awk 테스트를 위한 첫 번째 샘플 파일 내용
cat awk-sample.txt
# awk 테스트를 위한 두 번째 샘플 파일 내용
cat awk-sample1.txt


echo "print 액션을 사용하는 경우"
# awk-sample1.txt의 내용을 그대로 출력
awk '{ print }' awk-sample1.txt


echo "print 필드리스트 액션을 사용하는 경우"
# 1 번째 필드와 8 번째 필드 값 출력
awk '{print $1, $8}' awk-sample1.txt
# 파일의 레코드 번호를 파일 내용과 함께 출력
awk '{print FNR, $0}' awk-sample1.txt


echo "print 필드리스트 > 파일 액션을 사용하는 경우"
# 1 번째 필드와 8 번째 필드 값을 awk-result.txt 파일에 저장
awk '{print $1, $8}' > awk-result.txt awk-sample1.txt


echo "printf 포맷, 필드리스트 액션을 사용하는 경우"
# 8 번째 필드와 6 번째 필드를 지정한 포맷에 맞게 출력
awk '{printf "%-10s %s\n", $8, $6}' awk-sample1.txt


echo "printf 포맷, 필드리스트 > 파일 액션을 사용하는 경우"
# 8 번째와 6 번째 필드 값을 포맷에 맞게 awk-res.txt 파일에 저장
awk '{printf "%-10s %s\n", $8, $6}' > awk-res.txt awk-sample1.txt
# 저장된 awk-res.txt 파일 내용 확인
cat awk-res.txt


echo "getline 액션을 사용하는 경우"
# awk-sample1.txt의 짝수 번째 라인을 읽어 마지막 필드 값 출력
awk '{ getline; print $NF }' awk-sample1.txt


echo "getline var 액션을 사용하는 경우"
# awk-sample1.txt의 홀수 번째 라인을 읽어 마지막 필드 값 출력
awk '{ getline var; print $NF }' awk-sampel1.txt


echo "getline < 파일 액션을 사용하는 경우"
# awk-filetype.txt 파일에 Ascii_text를 다음과 같이 저장
# Ascii_text
# Ascii_text
# Ascii_text
vi awk_filetype.txt
# awk-filetype.txt의 값을 첫 번째 필드 값으로 변경하여 출력
awk '{ getline $1 < "awk-filetype.txt"; print }' awk-sample1.txt


echo "getline var < 파일 액션을 사용하는 경우"
# awk-test.txt 파일에 8이라는 숫자를 다음과 같이 저장
# 8
# 8
# 8
vi awk-test.txt
# awk-test.txt 값을 읽어 var에 저장하고, var에 해당하는 필드 값 출력
awk "{ getline var < "awk-test.txt"; print $var }' awk-sample1.txt