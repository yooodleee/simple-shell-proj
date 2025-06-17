#!/bin/bash


echo "확장 옵션"
echo "======================="


echo "-b/--characters-as-bytes 옵션을 사용하는 경우"
# 문자열 "테스트"의 길이 출력
echo "테스트" | awk '{ print length($1) }'
# -b 옵션에 의해 "테스트"에 소요된 총 바이트 수를 출력
echo "테스트" | awk -b '{ print length($1) }'


echo "-C/--copyright 옵션을 사용하는 경우"
# awk 라이센스 정보 출력
awk -C


echo "-d파일명/--dumpy-variables=파일명 옵션을 사용하는 경우"
# -d 옵션을 사용해 dum-var.txt에 내장 정보 저장
awk -d dump-var.txt '{print}' awk-sample1.txt
# 저장된 dump-var.txt 내용 확인


echo "-h/--help 옵션을 사용하는 경우"
# awk 사용법 및 옵션을 보여줌
awk -h


echo "-L 'fatal'/--lint='fatal' 옵션을 사용하는 경우"
# 테스트를 위한 빈 파일 생성 후 해당 파일을 이용해 awk 실행
echo "" > awk-prog.txt
awk -f awk-prog.txt awk-sample1.txt
# -L 옵션에 의해 에러 메시지를 보여줌
awk -L 'fatal' -f awk-prog.txt awk-sample1.txt


echo "-p 파일명/--profile=파일명 옵션을 사용하는 경우"
# 8번째 필드 출력 전 "Start--> 파일명"을 출력하고, 8번째 출력 후 "End--> 파일명"을 출력함
awk -p 'BEGINFILE { print "Start--> " FILENAME} { print $8 } ENDFILE { print "End--> " FILENAME}' awk-sample1.txt
# awkprof.out에 앞서 실행한 awk 프로그램 코드가 파싱되어 저장되었음
cat awkprof.out


echo "-S/--sandbox 옵션을 사용하는 경우"
# awk-filetype.txt의 파일 내용을 읽어 첫 번째 필드의 값을 변경함
awk '{ getline $1 < "awk-filetype.txt"; print }' awk-sample1.txt
# -S 옵션을 사용하면 awk-filetype.txt에서 파일 내용을 못 읽어옴
awk -S '{ getline $1 "awk-filetype.txt"; print }' awk-sample1.txt


echo "-V/--version 옵션을 사용하는 경우"
# 버전 정보와 라이센스 정보를 보여줌
awk -V