#!/bin/bash

# 원본 문자열 변수
filename="document.txt"

echo "원본 문자열: $filename"

# 1. 접미사 제거 (가장 짧은 일치)
echo "확장자 제거 (짧은 일치): ${filename%.*}"

# 2. 접미사 제거 (가장 긴 일치)
filepath="/home/user/docs/document.txt"
echo "파일 경로에서 확장자 제거 (긴 일치): ${filepath%%.*}"

# 3. 접두사 제거 (가장 짧은 일치)
echo "경로 제거 (짧은 일치): ${filepath#*/}"

# 4. 접두사 제거 (가장 긴 일치)
echo "경로 제거 (긴 일치): ${filepath##*/}"

# 5. 문자열 치환 (가장 처음 일치만)
text="apple banana apple"
echo "첫 apple을 orange로 변경: ${text/apple/orange}"

# 6. 문자열 전체 치환
echo "모든 apple을 orange로 변경: ${text//apple/orange}"

# 7. 접두사 존재 여부에 따라 기본값 설정
unset VAR
echo "VAR이 설정되지 않았을 때 기본값 사용: ${VAR:-default_value}"

# 8. 변수 값이 비어 있을 때 새 값으로 할당
VAR2=""
echo "VAR2가 비어있을 때 기본값 사용 및 할당: ${VAR2:=new_value}"
echo "VAR2의 새 값: $VAR2"

# 9. 문자열 길이 구하기
echo "filename의 길이: ${#filename}"

# 10. 부분 문자열 추출 (인덱스 0부터 시작, 길이 8)
echo "부분 문자열 (0~7): ${filename:0:8}"
