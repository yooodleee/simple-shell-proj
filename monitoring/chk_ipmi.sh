#!/bin/bash

# IPMI IP 및 User Id를 변수에 저장
ipmi_host="192.168.0.10 192.168.0.11 192.168.0.12 192.168.0.13"
ipmi_userid="admin"

# IPMI User ID에 해당하는 패스워드를 입력 받음
read -p "Please input ipmi password: " impi_pw
# 패스워드 입력을 안 했으면 입력을 하지 않았다는 메시지를 보여 주고, 스크립트 종료
if [[ -z $impi_pw ]]; then echo "You don't input ipmi password. Please retry.";
exit; fi

# ipmitool 명령어를 이용하여 해당 서버의 전원 체크
for host in $ipmi_hosts
do 
  echo "#### IPMI HOST:: $host ####"
  power_stat=$(ipmitool -I lanplus -H $host -L ADMINSTRATOR -U $ipmi_userid -P $impi_pw -v power status)
  echo "$power_stat"
done
