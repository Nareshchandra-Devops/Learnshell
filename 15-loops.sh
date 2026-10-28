#!/bin/bash

user_id=$(id -u)
log_folder="/var/log/shell-practice"
logs_file="${logss_folder}/${0}.log"

if [ $user_id -ne 0 ]; then
    echo "Please run this script with sudo access..."
    exit 1
fi

mkdir -p $log_folder

echo "Script started execution at $(date +"%F %T")" &>> $logs_file

validate(){
    if [ $1 -ne 0 ]; then
        echo "${2}..failed" | tee -a $logs_file
        exit 1
    else
        echo "${2}..success" | tee -a $logs_file
    fi
}

for package in $@
do
    echo "Going to install: ${package}
    dnf insttall $package -y &>> $logs_file
    validate $? "Installing ${package}
Done
