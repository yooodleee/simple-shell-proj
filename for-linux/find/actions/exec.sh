#!/bin/bash

echo "명령어 실행 관련 액션"
echo "======================="


echo "-delete 액션을 사용하는 경우"
# 삭제할 파일 확인
ls -l rootfile
# 검색된 파일 삭제
find ./ -name rootfile -delete
# 파일 삭제 여부 확인
ls -l rootfile


echo "-exec command {}; 액션을 사용하는 경우"
# 검색된 파일에서 grep을 이용해 다시 특정 문자열 검색
find ./ -name 'expression.txt' -exec grep CPU '{}' \;


echo "-exec command {}+ 액션을 사용하는 경우"
# 검색된 파일명을 echo를 이용해 그대로 보여줌
find ./ -name 'e*.txt' -exec echo '{}' \;
# 검색된 파일명을 echo를 이용해 그대로 보여주지만, 결과값이 연이어 출력됨
find ./ -name 'e*.txt' -exec echo '{}' +


echo "-execdir command {}; 액션을 사용하는 경우"
# 검색된 파일명을 보여줄 때 상대 경로를 함께 보여줌
find ./File/ -name 'f*txt' -exec echo '{}' \;
# 검색된 파일명만 보여줌
find ./File/ -name 'f*txt' -execdir echo '{}' \;


echo "-execdir command {} + 액션을 사용하는 경우"
# 상대 경로가 포함된 파일명을 연이어서 보여줌
find ./ -name 'f*' -exec echo '{}' +
# 파일명만 연이어서 보여줌
find ./ -name 'f*' -execdir echo '{}' +


echo "-ok command {}; 액션을 사용하는 경우"
# 파일명을 보여줄지 여부를 물어 경로를 포함한 파일명을 보여줌
find ./File/ -name 'f*' -ok echo '{}' \;


echo "-okdir command {}; 액션을 사용하는 경우"
# 파일명을 보여줄지 여부를 물어본 후 파일명만 보여줌
find ./File/ -name 'f*' -okdir echo '{}' \;


echo "-prune 액션을 사용하는 경우"
# 대소문자를 구분하지 않고 f로 시작하는 파일 검색
find . -iname 'f*'
# 검색된 파일이 디렉터리이면 하위 디렉터리는 검색하지 않음
find . -iname 'f*' -prune


echo "-quit 액션을 사용하는 경우"
# p로 시작하는 파일을 만나면 검색 종료
find ./ -name '*.txt' -or -name 'p*' -quit

