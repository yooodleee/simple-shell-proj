#!/bin/bash


echo "sed 기본 사용법"
echo "======================="


echo "sed 기본 사용법 1"
# grep을 이용해 변경할 대상 문자열 확인"
cat /etc/ssh/sshd_config | grep '^#PermitRoot'
# /etc/ssh/sshd_config 파일의 #PermitRoot를 PermitRoot로 변경
sed 's/#PermitRoot/PermitRoot/' /etc/ssh/sshd_config | grep '^PermitRoot'


echo "sed 기본 사용법 2"
# 스크립트 내용을 echo를 이용해 sed-script.txt에 저장
echo "s/#PermitRootLogin/PermitRootLogin/" > sed-script.txt
# -f 옵션을 이용하여 저장한 스크립트 파일을 이용하여 sed 수행
sed -f sed-script.txt /etc/ssh/sshd_config | grep '^PermitRoot'


echo "sed 기본 사용법 3"
# cat을 이용해 /etc/ssh/sshd_config 내용을 확인하고, sed는 cat의 결과에서 해당 문자열 변경
cat /etc/ssh/sshd_config | sed -e 's/#PermitRoot/PermitRoot/' | grep '^PermitRoot'

