#!/bin/bash

user_id=$(user_id -u)
logs-folder="/var/log/shell-practice"
logs_file="${logs_folder}/${0}.log"

if [ user_id -ne 0 ]; then
    echo " Please run this script with sudo access.."
    exit 1
fi

mkdir -p $logs_folder

echo "Script started excution at $ (date +"%F %T"); &?? $logs_file

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
    dnf list  installed $package &>> $logs_file
    if [ $? -ne 0 ]; then
        echo "Going Install: ${package}
        dnf install $package -y &>> $logs_file
        validate $? "Installing ${package}"
    else
        echo "${package} already installed...SKIPPING"
    fi
done