#!/bin/bash
set -e

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 3
fi


# OS 타입 확인
ostype=$(grep ^ID_LIKE /etc/*release | sed "s/ID_LIKE=//;s\"//g")

# 네트워크 정보를 사용자로부터 입력 받음
echo "=== Network Devices ==="
ip a | grep '^[0-9]' | awk '{print $1" "$2}' | grep -v -e 'lo' -e 'v' -e 't'
read -p "Please input network interface: " net_name
read -p "Please input network ip(ex:192.168.122.10/24): " net_ip
read -p "Please input network gateway: " net_gw
read -p "Please input network dns: " net_dns

# 하나라도 입력하지 않았을 경우 입력하라는 메시지 출력 후 script 종료
if [[ -z $net_name ]] || [[ -z $net_ip ]] || [[ -z $net_gw ]] || [[ -z $net_dns ]];
then
  echo "You need to input network information. Please retry this script."
  exit 1
fi

# OS가 Fedora일 경우 nmcli를 이용하여 네트워크 IP 설정
if [[ $ostype == "fedora" ]]; then
  nmcli con delete $net_name 2>/dev/null
  nmcli con add con-name $net_name type ethernet ifname $net_name ipv4.address $net_ip ipv4.gateway $net_gw ipv4.dns $net_dns ipv4.method manual
  nmcli con up $net_name

# OS가 Debian일 경우 netplan에 yaml 파일을 생성하여 네트워크 IP 설정
elif [[ $ostype == "debian" ]]; then
  ip_chk=$(grep $net_name /etc/netplan/*.yaml 2>/dev/null | wc -l)
  # 설정하고자 하는 IP로 설정 파일이 없을 경우 관련 네트워크 yaml 파일 생성 
  if [ $ip_chk -eq 0 ]; then
    cat > /etc/netplan/${net_name}.yaml << EOF
network:
  version: 2
  renderer: networkd
  ethernets:
    $net_name:
      dhcp4: no
      dhcp6: no
      addresses: [$net_ip]
      gateway4: $net_gw
      nameservers:
        addresses: [$net_dns]
EOF
    echo "cat /etc/netplan/${net_name}.yaml"
    cat /etc/netplan/${net_name}.yaml
    echo "apply netplan"
    netplan apply
  else
    echo "This $net_name is configured already."
  fi

else 
  echo "Unsupported OS type: $ostype"
  exit 2
fi