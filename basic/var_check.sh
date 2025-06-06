#!/bin/bash

echo "===================="
echo "변수 상태별 테스트"
echo "===================="

# 상태1: VAR1은 값이 설정됨
VAR1="hello"

# 상태 2: VAR2는 선언조차 되지 않음

# 상태 3: VAR3은 NULL 값으로 초기화
VAR3=""

echo 
echo "=> VAR1 테스트 (설정된 값 있음)"
echo "VAR1: '${VAR1}'"
if [ -z "$VAR1" ]; then
  echo "VAR1은 비어 있음"
else
  echo "VAR1은 값이 있음"
fi

echo 
echo "=> VAR2 테스트 (미선언 변수)"
echo "VAR2: '${VAR2}'"
if [ -z "$VAR2" ]; then
  echo "VAR2는 비어 있거나 선언되지 않음"
else
  echo "VAR2는 값이 있음"
fi

echo
echo "=> VAR3 테스트 (NULL 값)"
echo "VAR3: '${VAR3}'"
if [ -z "$VAR3" ]; then
  echo "VAR3는 비어 있음 (NULL)"
else
  echo "VAR3는 값이 있음"
fi

echo
echo "========================"
echo "파라미터 확장 구문 비교"
echo "========================"

echo "=> 기본값 제공 (\${VAR:-default})"
echo "VAR1: ${VAR1:-default}"
echo "VAR2: ${VAR2:-default}"
echo "VAR3: ${VAR3:-default}"

echo 
echo "=> 비어 있거나 unset이면 대입 (\${VAR:=default})"
echo "VAR4 이전: '${VAR4}'"
echo "결과: ${VAR4:=default}"
echo "VAR4 이후: '${VAR4}'"

echo 
echo "설정되지 않았으면 에러 출력 (\${VAR:?에러메시지})"
echo "VARS는 설정되어 있지 않음 -> 에러 발생 예정"