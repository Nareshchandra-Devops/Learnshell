#!/bin/bash

set -e
user_id=$(id -u)
logs_folder="/var//log/shell-practice"
logs_files=${logs_folder}/${0}.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[34m"

trap 'echo "Error at $LINENO", command: $"BASH_COMMAND" ERR

if [ $user_id -ne 0 ]; then
    echo "Please run this script with sudo access.."
    exit 1
fi

mkdir -p $logs_folder

echo "script sttarted  eexcution at $(date +"%F %T")" &>> $logs_files

for package in $@
do
    dnf list installed $package &>> $logs_file
    if [ $? -ne 0 ]; then
        echo "Going to install: ${package}"
        dnf install $package -y &>> logs_file
    else
        echo -e "${package} already installed...${Y}SKIPPING${N}
    fi
done

