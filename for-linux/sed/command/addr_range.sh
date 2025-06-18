#!/bin/bash


echo "sed 스크립트 | commands with accept address ranges"
echo "======================="


echo "sed 테스트를 위한 예제 파일 확인"
# sed 테스트를 위한 샘플 파일 내용
cat hosts


echo "b label command를 사용할 경우"
# 입력된 해당 라인에 값이 없으면 문자열 변경을 수행하지 않고, 라벨 호출
cat sed-script1.txt
# 스크립트 수행 결과 test가 dev로 변경되었음
sed -n -f sed-script.txt hosts


echo "c \text command를 사용할 경우"
# service.e가 있는 라인의 값을 변경
sed '/service.e/ c \122.10.10.30 vip.service.example.com' hosts | tail -n4


echo "d와 D command를 사용할 경우"
# 뉴라인 상관없이 test가 포함된 라인 삭제
sed -n '0,/yooodleee/ { s/We will test to replace/We will test to\nreplace/
test/ d 
> p }' hosts
# 패턴 공간에 포함된 뉴라인을 인식한 후 test가 포함된 라인 삭제
sed -n '0,/yooodleee/ { s/We will test to replace/We will test to\nreplace/
test/ D 
p }' hosts


echo "h와 H command를 사용할 경우"
# 홀드 버퍼 복사로 변경한 문자열 정보가 보이지 않음
sed -n '/Product/,+3 { s/Production/Service/ 
> h 
> p }' hosts


echo "g와 G command를 사용할 경우"
# 패턴 버퍼와 홀드 버퍼 사용 예
sed -n '/Product/,+3 { 
s/Production/Service/ 
h 
s/122.10.10/199.9.9/ 
g 
p }' hosts
# 대문자 H와 G를 사용할 경우 sed의 문자열 변경 과정을 볼 수 있음
sed -n '/Product/,+3 { 
s/Production/Service/ 
H 
s/122.10.10/199.9.9/ 
G 
p }' hosts


echo "l command를 사용할 경우"
# Production이 포함된 라인부터 아래 3라인까지 현재 읽어들인 라인 출력
sed -n '/Product/,+3 l' hosts


echo "l width command를 사용할 경우"
# 라인 너비를 20에 맞추어 보여줌
sed -n '/Product/,+3 l 20' hosts


echo "n과 N command를 사용할 경우"
# 입력된 라인의 다음 라인을 복사함. 복사 후 출력을 했으므로 복사한 값 출력
sed -n '/Product/,+3 { n p }' hosts
# 복사 전 출력을 했으므로 현재 입력된 라인을 출력
sed -n '/Product/,+3 { p N }' hosts


echo "p와 P command를 사용할 경우"
# 소문자 p는 패턴 공간 내용을 그대로 출력
sed -n '0,/yooodleee/ { 
> s/We will test to replace/We will test to\nreplace/
> p }' hosts
# 대문자 P는 패턴 공간을 출력하되, 뉴라인이 있는 라인은 뉴라인까지만 출력
sed -n '0,/yooodleee/ {
s/We will test to replace/We will test to\nreplace/
P }' hosts


echo "s/regexp/replacement/ command를 사용하는 경우"
# 첫 번째 라인부터 yooo가 포함도니 라인의 #을 공백으로 변경한 후 출력
sed -n '0,/yooo/ {
> s/^# //
> p }' hosts


echo "t label/T label command를 사용하는 경우"
# 해당 범위에 192.20.3이 있든 없든 label2로 분기하여 명령어 수행
sed -n '/# Test/,+3 {
:label2
s/172.10.2/192.20.3/
192.20.3/ t label2
p }' hosts
# 해당 범위에 172.10.2가 없기 때문에 label2로 분기됨
sed -n '/# Test/,+3 {
:label2
s/172.10.2/192.20.3/
/172.10.2/ T label2
p }' hosts


echo "w와 W filename command를 사용하는 경우"
# w 명령어로 변경된 패턴 내용을 sed-w.txt에 저장
sed -n '0,/yooodleee/ {
s/We will test to replace/We will test to\nreplace/
w sed-w.txt
p }' hosts
# w 명령어로 변경된 패턴 내용을 sed-w.txt에 저장
sed -n '0,/yooodleee/ {
s/We will test to replace/We will test to\nreplace/
W sed-w.txt
p }' hosts
# 저장된 sed-w.txt 파일 내용 확인
cat sed-w.txt


echo "x command를 사용하는 경우"
# 패턴 버퍼와 홀드 버퍼의 내용을 두 번 교환하여 파일이 수정되지 않음
sed -n '/# Test/,+3 {
x
s/172.10.2./192.20.3/
x
p }' hosts


echo "y/source/dest/ command를 사용하는 경우"
sed -n '/# Test/,+3 {
y/test/TEST/
p }' hosts