#!/bin/bash

echo "1. 숫자를 세는 while"

count=1
while [ $count -le 5 ]; do
  echo "현재 숫자: $count"
  ((count++)) # count=$((count + 1))
done

echo

echo "2. 사용자 입력을 기다리는 반복문"

input=""
while [ "$input" != "exit" ]; do
  read -p "종료하려면 'exit' 입력: " input
  echo "입력한 값: $input"
done

echo "프로그램을 종료합니다."

echo 

echo "3. 파일 한 줄씩 읽기"

file="sample.txt"

# sample.txt가 없으면 샘플 파일 생성
if [ ! -f "$file" ]; then
  echo -e "첫 줄\n 두 번째 줄\n 세 번째 줄" > "$file"
fi

echo

echo "4. 무한 루프 + break 사용"

i=0
while true; do
  echo "무한 루프 중... $i"
  ((i++))
  if [ "$i" -ge 3]; then
    echo "조건 만족, 루프 종료."
    break
  fi
done