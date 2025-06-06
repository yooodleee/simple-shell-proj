#!/bin/bash

echo "========================="
echo "인자를 다음과 같이 전달했다고 가정하겠습니다:"
echo "./param_diff sh apple banana \"fruit salad\""
echo "========================="
echo 

echo "=> \$* result:"
for arg in $*; do
  echo " [$arg]"
done

echo
echo "=> \$@ result:"
for arg in $@; do
  echo " [$arg]"
done

echo
echo "=> \"\$*\" result:"
for arg in "$*"; do
  echo " [$arg]"
done

echo 
echo "=> \"\$@\" result:"
for arg in "$@"; do
  echo " [$arg]"
done