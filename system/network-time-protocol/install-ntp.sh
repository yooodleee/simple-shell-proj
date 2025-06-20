#!/bin/bash


echo "다수의 서버에 NTP 서버 설치"
echo "======================="


# NTP를 설치할 대상 서버 정보 저장
servers='host01 host02 host03'
cmd1='cat /etc/*release | grep ID_LIKE | sed "s/ID_LIKE=//;s/\"//g"'
cmd2=''


for server in $servers; do
  # 해당 서버의 OS 타입 확인
  ostype=$(sshpass -p $1 ssh root@server $cmd1)

  # OS가 Fedora 계열인지 Debian 계열인지 확인
  if [[ $ostype == "fedora" ]]; then
    cmd2="yum install -y ntp"
  elif [[ $ostype == "debian" ]]; then
    cmd2="apt-get install -y ntp"
  fi

  # 해당 OS에 ntp 설치
  sshpass -p $1 ssh root@server $cmd2
done
