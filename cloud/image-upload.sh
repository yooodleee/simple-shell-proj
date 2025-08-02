#!/bin/bash

# 이미지 경로를 입력 받음
read -p "Please input image path : " imagepath

# 이미지가 해당 경로에 있는지 확인
if [[ -f $imagepath ]]; then
  
  # 업로드할 이미지명을 입력 받음
  read -p "Please input image name : " imagename
  
  # 인증 파일 export
  source ~/adminrc
  
  # CLI를 이용한 이미지 업로드
  openstack image create \
  --file $imagepath \
  --container-format bare \
  --disk-format $(ls $imagepath | awk -F . '$NF == "qcow2" ? type="qcow2" : type="raw" {print type}') \
  --public \
  $imagepath

else
  # 이미지가 없을 경우 에러 메시지 출력 후 스크립트 종료
  echo "This is no image. Please try to run the script again."
  exit;
fi
