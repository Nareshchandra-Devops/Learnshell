#!/bin/bash

user_id=$(id -u)
log_folder="/var/log/shell-practice"
script_name=$(basename "$0" .sh)
logs_file="${log_folder}/${script_name}.log"

if [ "$user_id" -ne 0 ]; then
    echo "Please run this script with sudo access..."
    exit 1
fi

if [ $# -eq 0 ]; then
    echo "Usage: sudo $0 <package1> <package2> ..."
    exit 1
fi

mkdir -p "$log_folder"

echo "Script started execution at $(date +"%F %T")" &>> "$logs_file"

validate() {
    if [ "$1" -ne 0 ]; then
        echo "${2}..failed" | tee -a "$logs_file"
        exit 1
    else
        echo "${2}..success" | tee -a "$logs_file"
    fi
}

for package in "$@"
do
    echo "Going to install: ${package}" | tee -a "$logs_file"
    dnf install "$package" -y &>> "$logs_file"
    validate $? "Installing ${package}"
done