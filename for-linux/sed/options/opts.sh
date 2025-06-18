#!/bin/bash


echo "sed options"
echo "======================="


echo "-n, --quiet, --silent option"
# 패턴 공간의 내용은 출력하지 않고, 명령어에 의한 내용만 출력
sed -n '1,5 p' hosts


echo "-e script, --expression=script option"
# -e 옵션을 사용하여 2개 이상의 스크립트 실행 가능
sed -n -e '/172.1.2.*/ s/test/imsi/p' -e 's/Test/Imsi/p' hosts


echo "-f scriptfile, --file=scriptfile option"
# 테스트를 위해 sed script 내용을 script.txt 파일에 저장
echo "/test[0-9].[a-z]*/ s/172.1.2/192.10.8/p" > script.txt
# 저장한 파일을 이용해 hosts의 IP 수정
sed -n -f script.txt hosts


echo "-i file extension, --in-place=file option"
# -i 옵션을 사용하여 hosts의 IP를 바로 수정
sed -i '/test[0-9].[a-z]*/ s/172.1.2/192.10.8/' hosts
# cat과 grep 명령어를 통해 파일 내용이 수정되었는지 확인
cat hosts | grep 'test[0-9].[a-z]*'
# -i 옵션을 사용하여 hosts의 IP를 바로 수정
sed -i.bak '/test[0-9].[a-z]*/ s/192.10.8/192.1.2/' hosts


echo "--follow-symkinks option"
# 테스트를 위해 hosts를 바로 보는 심볼릭 링크 sym-hosts 생성
ln -s hosts sym-hosts
# 생성된 파일 목록 확인
ll *hosts
# --follow-symlinks 옵션을 이용하여 심볼릭 링크 내용 수정
sed --follow-symlinks -i '/test[0-9].[a-z]*/ 
s/172.1.2/192.10.8/' sym-hosts
# 심볼릭 링크와 연결된 hosts가 정상적으로 수정
ll *hosts
# --follow-symlinks 옵션 없이 심볼릭 링크 내용 수정
sed -i '/test[0-9].[a-z]*/ s/172.1.2/192.10.8/' sym-hosts
# 심볼릭 링크가 바로 수정되면서 파일로 변경되었음
ll *hosts


echo "-c, --copy option"
# -c 옵션은 -i 옵션 바로 뒤에 와야 함
sed -ic '/test[0-9].[a-z]*/ s/192.1.2/172.10.2/' hosts
# hostsc라는 파일이 생성된 것을 확인할 수 있음
ll hosts*


echo "-l N, --line-length=N option"
# 테스트를 위해 장문의 문자열을 file로 저장
echo "This is a test sentence for testing line length. sed
command has line brak function, If you want to apply this 
function, you can use - l N option. N is number of line length" > sed-line-length.txt 
# 너비 50 column에 맞춰 sed-line-length.txt 출력


echo "-r, --regexp-extended option"
# 확장 정규 표현식을 이용하여 영문소문자와 숫자로 이루어진 문자열에 해당하는 라인 출력
sed -n -r '/[[:lower:]]+[0-9].*/ p' hosts


echo "--posix option"
# -r 옵션이 있어도 --posix 옵션이 있으면 확장 정규 표현식이 적용되지 않음
sed -n -r --posix '/[[:lower:]]+[0-9].*/ p' hosts


echo "-s, --separate option"
# -s 옵션 없이 hosts와 hostsc 파일의 마지막 라인 번호를 출력하면 38이 출력됨
sed -n '$=' hosts hostsc
# -s 옵션과 함께 hosts와 hostsc 파일의 마지막 라인 번호를 출력하면 각각 출력됨
sed -n -s '$=' hosts hostsc


echo "-z, --null-data option"
# Script 디렉터리에서 CPU라는 단어가 포함된 txt 파일 경로 탐색
grep -lZ CPU ./*.txt
# null 값으로 구분된 파일명을 sed의 -z 옵션을 사용하여 현재 디렉터리(./) 기호 삭제
grep -lZ CPU ./*.txt | sed -z 's/^.\///'
# xargs를 이용해 null이 구분 기호로 되어 있는 문자열 출력
sed -z 's/^.\///' sed-test.txt | xargs -0 echo


echo "--help option"
sed --help


echo "--version option"
sed --version