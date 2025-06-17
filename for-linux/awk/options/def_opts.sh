#!/bin/bash


echo "awk 표준 옵션"
echo "======================="


echo "awk 테스트를 위한 예제 파일 확인"
# awk 테스트를 위한 첫 번째 샘플 파일
cat awk-sample.txt
# awk 테스트를 위한 두 번째 샘플 파일
cat awk-sample1.txt
# awk 테스트를 위한 세 번째 샘플 파일
cat awk-test.csv


echo "-f 파일 / --file 파일 옵션을 사용하는 경우"
# 패턴과 액션을 awk-prog.txt 파일에 저장
echo '$2 == 2 { print $NF }' > awk-prog.txt
# awk-prog.txt 파일을 이용하여 디렉터리명 추출
awk -f awk-prog.txt awk-sample.txt


echo "-F 구분 기호/--field-separator 구분 기호 옵션을 사용하는 경우"
# awk-test.csv의 이름 출력 실패
awk ' { print $1 }' awk-test.csv
# -F 옵션을 이용해 awk-test.csv의 이름 출력 성공
awk -F ',' '{ print $1 }' awk-test.csv


echo "-v 변수=값 / --assign 변수=값 옵션을 사용하는 경우"
 # label에 저장된 "Filename: "이라는 문자열을 파일명과 함께 출력
 awk -v label="Filename: " '{ print label $NF }' awk-sample1.txt