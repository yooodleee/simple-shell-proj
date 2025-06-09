#!/bin/bash

echo "원하는 작업을 선택하세요:"
echo "1) 시작"
echo "2) 중지"
echo "3) 재시작"
echo "4) 상태 확인"

read -p "번호를 입력하세요 (1~4): " choice

case "$choice" in
  1)
    echo "서비스를 시작합니다..."
    # 실제 서비스 시작 명령어 예: systemctl start myservice
    ;;
  2)
    echo "서비스를 중지합니다..."
    # 실제 서비스 중지 명령어 예: systemctl stop myservice
    ;;
  3)
    echo "서비스를 재시작합니다..."
    # 실제 서비스 재시작 명령어 예: systemctl restart myservice
    ;;
  4)
    echo "서비스 상태를 확인합니다..."
    # 실제 상태 확인 명령어 예: systemctl status myservice
    ;;
  *)
    echo "잘못된 입력입니다. 1~4 중에서 선택해주세요."
    ;;
esac
