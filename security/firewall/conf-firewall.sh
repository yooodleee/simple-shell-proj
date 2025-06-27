#!/bin/bash


# OS 타입 확인
ostype=$(cat /etc/*release | grep ID_LIKE | sed "s_ID_LIKE=//;s/\"//g")

read -p "Please input ports(ex: http 123/tcp 123/udp) : " ports

if [[ -z $ports ]]; then echo "You didn't input port. Please retry."; exit; fi

# OS 타입이 Fedora인 경우
if [[ $ostype == "fedora" ]]; then
  # firewalld 실행 상태 확인
  run_chk=$( firewall-cmd --state )
  if [[ $run_chk == "running" ]]; then
    # 입력 받은 port만큼 반복
    for port in $ports; do
      # service port인지, 일반 port인지 확인
      chk_port=$(echo $port | grep '^[a-zA-Z]' | wc -l)
      # service port일 경우
      if [[ chk_port -eq 1 ]]; then
        firewall-cmd --add-service=$port
        firewall-cmd --add-service=$port --permanent
      # 일반 port일 경우
      else
        firewall-cmd --add-port=$port
        firewall-cmd --add-port=$port --permanent
      fi
    done
    # port 추가 결과 확인
    firewall-cmd --list-all
  fi
# OS 타입이 Debian인 경우
elif [[ $ostype == "debian" ]]; then
  # ufw 실행 상태 확인
  run_chk=$( uwf status | grep ": active" | wc -l )
  if [[ $run_chk -eq 1 ]]; then
    # 입력 받은 port 만큼 반복
    for port in $ports; do
      ufw allow $port 
    done
    # port 추가 결과 확인
    uwf status
  fi
fi