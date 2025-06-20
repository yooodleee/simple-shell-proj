#!/bin/bash


echo "date options"
echo "======================="


echo "-d 문자열, --date=문자열 옵션"
# 현재 시간을 기준으로 내일 시간을 보여줌
date -d "tomorrow"
# 현재 시간을 기준으로 10년 전 시간을 보여줌
date -d "10 years ago"
# 현재 시간을 기준으로 10일 후 시간을 보여줌
date -d "+10 day"
# 현재 시간을 기준으로 3주 전 시간을 보여줌
date -d "-3 week"


echo "-f 파일, --file=파일 옵션"
# 테스트를 위한 -5 day를 date-test.txt에 저장
echo "-5 day" > date-test.txt
# -f 옵션을 이용하여 저장한 date-test.txt에서 정보를 읽어 해당 날짜를 보여줌
date -f date-test.txt


echo "-I[타임스팩], --iso-8601[=타임스팩] 옵션"
# 현재 날짜를 보여줌
date -I
# ISO 8601 형식으로 현재 날짜와 시각을 함께 보여줌
date -Ihours
# ISO 8601 형식으로 현재 날짜, 시각 및 나노초까지 보여줌
date --iso-8601=ns


echo "-r 파일, --reference=파일 옵션"
# date-test.txt 파일의 최근 수정 일자를 보여줌
date -r date-test.txt


echo "-R, --rfc-2822 옵션"
# RFC 2822 형식으로 현재 날짜와 시간을 보여줌
date -R
# -d 옵션을 사용하면 해당 일자는 RFC 2822 형식으로 보여줌
date -R -d '+1 day'


echo "--rfc-3339=타임스팩 옵션"
# RFC 3339 형식으로 현재 날짜와 시간 및 초를 보여줌
date --rfc-3339=seconds


echo "-s 문자열, --set=문자열 옵션"
# 현재 일자 확인
date
# 하루 후로 날짜 변경
date -s "1 day"
# 변경된 날짜 확인
date


echo "-u, --utc, --universal 옵션"
# UTC 형식으로 현재 시간을 보여줌
date -u


echo "--help 옵션"
# date의 사용법과 옵션, 포맷 정보를 보여줌
date --help


echo "--version 옵션"
# date의 현재 버전을 보여줌
date --version

