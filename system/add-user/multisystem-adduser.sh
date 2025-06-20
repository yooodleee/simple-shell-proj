#!/bin/bash

echo "원격 서버의 사용자 생성 및 패스워드 설정"
echo "======================="

if [[ -n $1 ]] && [[ -n $2 ]]; then

  UserList=($1)
  Password=($2)

  if [[ ${#UserList[@]} -ne ${#Password[@]} ]]; then
    echo "Error: Number of users and passwords must match."
    exit 1
  fi

  for server in host01 host02 host03
  do
    for (( i=0; i < ${#UserList[@]}; i++ ))
    do
      if ! grep -q "^${UserList[$i]}:" /etc/passwd; then
        echo "Creating ${UserList[$i]} on $server..."
        ssh root@$server "useradd ${UserList[$i]}"
        ssh root@$server "echo ${Password[$i]} | passwd ${UserList[$i]} --stdin"
      else
        echo "User ${UserList[$i]} already exists on local machine"
      fi
    done
  done

else
  echo -e 'Please input user id and password.\nUsage: multisystem-adduser.sh "user01 user02" "pw01 pw02"'
fi
