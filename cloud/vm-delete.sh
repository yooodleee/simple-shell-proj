#!/bin/bash

# 인증 파일 export
source ~/adminrc

echo "This script will make a script about instance delete."

# 오픈 스택 명령어를 이용한 인스턴스 삭제 명령 생성
openstack server list --all-projects -c ID -f value | awk '{print "openstack 
server delete "$1}' > ~/vm_delete.sh
