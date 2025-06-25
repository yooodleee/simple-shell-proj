#!/bin/bash


# 대상 서버와 계정 정보 변수 저장
hosts="host01 host02"
account="root stack user01 user02"

# 대상 서버만큼 반복
for host in $hosts; do
  echo "##### $host #####"
  # 계정 정보만큼 반복
  for user in $account; do
    # 패스워드 설정 주기 체크
    pw_chk=$(ssh -q root@$host "change -l $user | grep 99999 | wc -l")
    # 패스워드 설정 주기가 설정되어 있지 않다면
    if [[ $pw_chk -eq 1 ]]; then
      # 패스워드 설정 주기를 90일로 설정
      ssh -q root@$host "change -d $(date +%Y-%m-%d) -M 90 $user"
      echo "=====> $user"
      # 설정 결과 확인
      ssh -q root@$host "change -l $user"
    fi
  done
done