#!/bin/bash

echo "파일 및 디렉터리 관련 옵션"
echo "======================="

echo "-a, --text 옵션을 사용하는 경우"
echo "테스트를 위한 grep 명령어 파일 복사"
cp /bin/grep ./grep_binary_test

echo "복사한 바이너리 파일인 grep_binary_test에서 Context라는 단어 검색"
grep -a '^Context' grep_binary_test

echo "--binary-files=TYPE 옵션을 사용하는 경우"
echo "바이너리 파일 타입이 binary일 때는 파일에 매칭되는 패턴이 있다는 메시지를 보여줌"
grep --binary-files=binary '^Context' grep_binary_test

echo "바이너리 파일 타입이 text일 때는 패턴이 포함된 라인을 보여줌"
grep --binary-files=text '^Context' grep_binary_test

echo "-D ACTION, --devices=ACTION 옵션을 사용하는 경우"
echo "디바이스 파일을 검색하려고 시도하다가 권한 에러 발생"
sudo grep -D read 'loop' /dev/mem

echo "디바이스 파일을 검색하지 않았음"
sudo grep -D skip 'loop' /dev/mem

echo "-d ACTION, --directories=ACTION 옵션을 사용하는 경우"
echo "테스트를 위한 디렉터리 생성"
mkdir test-dir

echo "현재 경로의 모든 파일 및 디렉터리에서 CPU라는 단어 검색"
grep -d read 'CPU' ./*

echo "현재 경로의 디렉터리는 제외하고 CPU라는 단어 검색"
grep -d skip 'CPU' ./*

echo "--exclude=GLOB 옵션을 사용하는 경우"
echo "현재 디렉터리 내의 파일 목록"
ls

echo "express로 시작하는 파일은 제외하고 검색"
grep --exclude=express* 'CPU' ./*

echo "--exlucde-from=FILE 옵션을 사용하는 경우"
echo "압축 파일은 제외하고 패턴 검색"
grep --exclude-from=expression.tar.gz 'CPU' ./*

echo "--exclude-dir=DIR 옵션을 사용하는 경우"
echo "테스트를 위한 file-dir이라는 디렉터리를 생성하고 file1.txt 파일을 file-dir로 이동"
mkdir file-dir; mv file*.txt file-dir

echo "-r 옵션만 사용하여 검색하면 file-dir 내의 file1.txt 파일도 함께 검색"
grep -r 'mail' ./*

echo "-I 옵션을 사용하는 경우"
echo "바이너리 파일에 일치하는 단어가 있어도 없는 것처럼 보여줌"
grep -I '^Context' grep_binary_test

echo "--include=GLOB 옵션을 사용하는 경우"
echo "express로 시작하는 파일에서 CPU라는 단어 검색"
grep --include=express* 'CPU' ./*

echo "-r, --recursive 옵션을 사용하는 경우"
echo "-r 옵션을 이용하여 하위 디렉터리까지 검색"
grep -r --include=expression* 'CPU' ./*

echo "-R, --dereference-recursive 옵션을 사용하는 경우"
echo "테스트를 위한 expression.txt를 바라보는 express.txt 심볼릭 링크 생성"
cd file-dir
ln -s ../expression.txt express.txt
ls -l express.txt

echo "-r 옵션을 사용했을 경우에는 express.txt 파일은 검색 대상에서 제외"
grep -r 'CPU' ./*

echo "-R 옵션을 사용했을 경우에는 express.txt 파일도 검색됨"
grep -R 'CPU' ./*