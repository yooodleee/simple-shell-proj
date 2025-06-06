#!/bin/bash

echo "======================"
echo "Special Params Example"
echo "======================"

echo "=> Script name: \$0 = $0"
echo "=> Args num: \$# = $#"
echo "=> Total Args (seperate space): \$* = $*"
echo "=> Total Args: \$@ = $@"

echo
echo "=> current process ID: \$\$ = $$"

# 백그라운드로 간단한 sleep 실행
sleep 2 &
SLEEP_PID=$!
echo "=> current background's PID: \$! = $SLEEP_PID"

# 의도적인 명령 실패"
echo
echo "=> 실패한 명령 실행 (없는 명령어 실행)"
fake_command 2>/dev/null
echo "=> 최근 명령의 종료 상태: \$? = $?"

# 성공적인 명령
echo
echo "=> 성공한 명령 실행 (echo)"
echo "Hello World!"
echo "=> 최근 명령의 종료 상태: \$? = $?"

echo 
echo "======================"
echo "인자 반복 출력 (\$@ 기준)"
echo "======================="
i=1
for arg in "$@"; do
  echo "인자 $1: $arg"
  ((i++))
done