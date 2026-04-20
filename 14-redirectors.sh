#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOG_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log"

mkdir -p $LOG_FOLDER

USERID=$(id -u)

CHECK_ROOT(){
    if [ $? -ne 0 ]
    then
        echo -e "$Y Please proceed with the root privileges..$N"  | tee -a $LOG_FILE
        exit 1
    fi
}

USAGE(){
    echo -e "$R USAGE:: sudo sh 16-redirectors.sh package1 package2..$N"  
    exit 1
}


VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2.. is $R failed $N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e "$2.. is $G success $N" | tee -a $LOG_FILE
    fi
}



echo -e "Script started executing at: $(date)" | tee -a $LOG_FILE

CHECK_ROOT 

if [ $# -eq 0 ]
then
    USAGE
fi

for package in $@
do
    dnf list installed $package &>> $LOG_FILE
    if [ $? -ne 0 ]
    then 
        echo -e "$Y $package is not installed..Going to install it..$N" | tee -a $LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "Insatalling $package"
    else
        echo -e "$package is $Y already Installed nothing to do..$N" | tee -a $LOG_FILE
    fi
done