#!/bin/bash


echo "date 사용법"
echo "======================="


echo "date 기본 사용법 1"
# 현재 날짜를 설정된 로케일 형식으로 보여줌
date
# 현재 시간을 기준으로 어제 시간을 보여줌
date -d yesterday


echo "date 기본 사용법 2"
# 현재 시간을 명시한 포맷에 맞추어 보여줌"
date '+%Y-%m-%d %l:%M:%p'


echo "date 기본 사용법 3"
# 현재 시간을 기준으로 어제 시간을 명시한 포맷에 맞게 보여줌
date -d yesterday '+%A, %B %d,%Y'