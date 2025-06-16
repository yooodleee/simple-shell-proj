#!/bin/bash

echo "결과 출력 관련 액션"
echo "======================="


echo "-fls file 액션을 사용하는 경우"
# f로 시작하는 파일을 한번 더 ls -l한 결과를 파일에 저장
find ./ -name 'f*' -fls f-file.txt


echo "-fprintf file 액션을 사용하는 경우"
# p로 시작하는 파일을 p-file.txt에 저장
find ./ -name 'p*' -fprintf p-file.txt


echo "-fprintf0 file 액션을 사용하는 경우"
# 뉴라인이나 공백 없이 결과를 파일에 저장
find ./ -name 'p*' -fprintf0 p-file1.txt


echo "-printf format 액션을 사용하는 경우"
# 포맷에 의해 결과를 출력
find ./ -name 'p*' -printf '%f %c\n'


echo "-fprintf file format 액션을 사용하는 경우"
# 포맷에 의한 결과를 파일로 저장
find ./ -name 'p*' -fprintf p-file2.txt '%f %c\n'


echo "-ls 액션을 사용하는 경우"
# 검색된 파일을 ls -l을 실행한 것처럼 보여줌
find ./ -name 'p*' -ls


echo "-print 액션을 사용하는 경우"
# 검색된 파일을 보여줌
find ./ -name 'p*' -print


echo "-print0 액션을 사용하는 경우"
# 공백이나 뉴라인 없이 검색된 파일을 보여줌
find ./ -name 'p*' -print0