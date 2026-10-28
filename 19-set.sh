#!/bin/bash

set -e
trap 'echo "Error at line $LINENO, command: $BASH_COMMAND"' ERR

user_id=$(id -u)
logs_folder="/var/log/shell-practice"
script_name=$(basename "$0" .sh)
logs_file="${logs_folder}/${script_name}.log"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ "$user_id" -ne 0 ]; then
    echo -e "${R}Please run this script with sudo access..${N}"
    exit 1
fi

mkdir -p "$logs_folder"

echo "Script started execution at $(date +"%F %T")" &>> "$logs_file"

for package in "$@"
do
    if ! dnf list installed "$package" &>> "$logs_file"; then
        echo "Going to install: ${package}" | tee -a "$logs_file"
        dnf install "$package" -y &>> "$logs_file"
        echo -e "Installing ${package}...${G}SUCCESS${N}" | tee -a "$logs_file"
    else
        echo -e "${package} already installed...${Y}SKIPPING${N}" | tee -a "$logs_file"
    fi
done