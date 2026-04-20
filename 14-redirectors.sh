#!/bin/bash

LOG_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log"

mkdir -p $LOG_FOLDER

USERID=$(id -u)

CHECK_ROOT(){
    if [ $? -ne 0 ]
    then
        echo "Please proceed with the root privileges.."  | tee -a $LOG_FILE
        exit 1
    fi
}

USAGE(){
    echo "USAGE:: sudo sh 16-redirectors.sh package1 package2.."  
    exit 1
}


VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2.. is failed" | tee -a $LOG_FILE
        exit 1
    else
        echo "$2.. is success" | tee -a $LOG_FILE
    fi
}



echo "Script started executing at: $(date)" | tee -a $LOG_FILE

CHECK_ROOT 

if [ $# -eq 0 ]
then
    USAGE
fi

for package in $@
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then 
        echo "$package is not installed..Going to install it.." | tee -a $LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "Insatalling $package"
    else
        echo "$package is already imstalled nothing to do.." | tee -a $LOG_FILE
    fi
done