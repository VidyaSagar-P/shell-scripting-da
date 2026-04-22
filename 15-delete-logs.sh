#!/bin/bash

SRC_DIR="/home/ec2-user/logs/"

if [ -d $SRC_DIR ]
then
    echo "$SRC_DIR is exists"
else
    echo "$SRC_DIR does not exists"
    exit 1
fi

FILES=$(find $SRC_DIR -name "*.log" -mtime +14)

while IFS= read -r line 
do
    echo "deleting file:: $line"
    rm -rf $line
done <<< $SRC_DIR