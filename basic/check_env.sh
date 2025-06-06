#!/bin/bash

echo "========================="
echo "system & user info"
echo "========================="
echo "user name: $USER"
echo "home directory: $HOME"
echo "current shell: $SHELL"
echo "logined user: $(whoami)"
echo "host name: $HOSTNAME"
echo "current working directory: $PWD"
echo "user ID (UID): $UID"
echo "group ID (GID): $(id -g)"
echo "user group: $(id - Gn)"

echo 
echo "========================="
echo "date & time"
echo "========================="
echo "current date: $(date)"
echo "UTC time: $(date -u)"
echo "system uptime: $(uptime -p)"

echo 
echo "========================="
echo "OS & Kernel Information"
echo "========================="
echo "OS: $(uname -o)"
echo "Kernel version: $(uname -r)"
echo "Total Kernel Info: $(uname -a)"

echo 
echo "========================="
echo "Network Information"
echo "========================="
echo "IP Adress: $(hostname -I | aws '{print $1}')"
echo "Domain Name: $(dnsdomainname)"
echo "DNS Info:"
cat /etc/resolv.conf | grep nameserver

echo 
echo "========================="
echo "Envrionment Variable List"
echo "========================="
echo "PATH: $PATH"
echo "LANG: $LANG"
echo "TERM: $TERM"
echoo "EDITOR: $EDITOR"

echo 
echo "========================="
echo "Login Session Info"
echo "========================="
who 