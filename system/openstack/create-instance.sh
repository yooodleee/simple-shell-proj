#!/bin/bash


echo "CLI를 이용하여 Openstack Instance 생성"
echo "======================="


# 인스턴스 명 입력
read -p "Input instance name: " vmname

# 이미지 정보 
echo "== Image List =="
openstack image list -c Name -f value
read -p "Input image name : " image

# 네트워크 정보
echo "== Network List =="
openstack network list -c Name -f value
read -p "Input network name : " net

# Flavor 정보
echo "== Flavor List =="
openstack flavor list -c Name -f value
read -p "Input flavor name : " flavor

# 보안 그룹 정보 
echo "== security Group List =="
openstack security group list --project $OS_PROJECT_NAME -c Name -f value
read -p "Input security group name : " sec
secgrp=$(openstack security group list --project $OS_PROJECT_NAME -f value -c ID -c Name | grep "$sec\$" | awk '{print $1}')

# SSH Key 정보
echo "== Keypair List =="
openstack keypair list -c Name -f value
read -p "Input keypair name : " keypair

# 볼륨 생성
echo "==Create Volume =="
read -p "Input volume size : " size
openstack volume create --size $size --image $image --bootable $vmname

# 인스턴스 생성
echo "Create Instance Starting"
openstack server create \
--volume $(openstack volume list --name $vmname -f value -c ID) \
--flavor $flavor \
--security-group $secgrp \
--key-name $keypair \
--network $net \
--wait \
$vmname

