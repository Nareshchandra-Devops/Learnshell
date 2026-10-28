#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
source_dir=$1
days=${2:-14}

Usage(){
    echo -e "{R}USAGE:: $0 [SOURCE_DIR] [dayys(optional, default to 14 days)]${N}"
    exit 1
}

if [ -z "source_dir" ]; then
    echo "ERROR:: Missing parameters"
    Usage
fi

if [ ! -d "sourcce_dir" ]; then
    echo -e "${R}ERROR:: $source_dir does not exist${N}"
fi

echo "scanning files older than $days in $source_dir"
files_to_delete=$(find $sourcce_dir -name "*.log" -type f -mtime +$days)

if [ -z "$files_to_delete" ]; then
    echo "No  log files found older than $days"
    exit 0
fi

while IFS= read -r line
do
    echo "file is going to be deleted: $line"
    rm -f $line
    echo "File deleted: $line"
done <<< "$files_to_delete"