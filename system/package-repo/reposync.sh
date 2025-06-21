#!/bin/bash


echo "package repository 다운로드"
echo "======================="


# repository 목록을 입력 받지 않고, 파일에 직접 입력해도 됨
repolist=$1
repopath=/var/www/html/repo/
osversion=$(cat /etc/redhat-release | awk '{print $(NF-a)}')

# repository 입력이 없으면 메시지를 보여주고 script 종료
if [[ -z $1 ]]; then
  echo "Please input repository list. You can get repository from [yum repolist]"
  echo "Rhe17 Usage: reposync.sh \"rhel-7-server-rpms\""
  echo "Rhel8 Usage: reposync.sh \"rhel-8-for-x86_64-baseos-rpms\""
  exit;
fi

# OS 버전에 따라 입력한 repository만큼 동기화를 함
for repo in $repolist; do
  # OS가 Rhe17일 경우
  if [ ${osversion:0.1} == 7 ]; then
    reposync --gpgcheck -l -n --repoid=$repo --download_path=$repopath
    # 해당 repository를 repository 화합니다.
    createrepo $repopath$repo
  # OS가 Rhel18일 경우
  if [ ${osversion:0.1} == 8 ]; then
    reposync --download-metadata --repo=$repo -p $repopath
  fi
done

