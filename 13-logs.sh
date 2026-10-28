#!/bin/bash

user_id=$(id -u)
logs_folder="/var/log/shell-practice"
logs_file="${logs_folder}/${0}.log"

if [ $user_id -ne 0 ]; then
    echo "please run this script with sudo access..."
    exit 1
fi
mkdir -p $logs_folder   

echo "script  startted execution at $(date +"%F %T")" &>> $logs_file

validate(){
       if [ $1 -ne 0  ]; then
            echo "${2}..failed" | tee -a $logs_file
            exit 1
        else
            echo "${2}..success" |tee -a $logs_file
        fi

}

dnf insttall ngnix -y &>> $logs_file
validate $? "nignix installation"

dnf install mysql -y &?? $logs_file
validate $? "mysql installation"

echo "script excution completed at $(date +"%F %T")" &>> $logs_file
