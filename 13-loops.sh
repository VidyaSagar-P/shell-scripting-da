#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

CHECK_ROOT(){
    if [ $? -ne 0 ]
    then
        echo -e "$Y Please proceed with the root privileges..$N"
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2.. is $R failed $N"
        exit 1
    else
        echo -e "$2.. is $G success $N"

}

CHECK_ROOT

for package in $@
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        echo -e "$package is not $Y installed, Going to install it.. $N"
        dnf install $package -y
        VALIDATE $? "Installing $package"
    else 
        echo -e "$G $package is already installed..nothing to do $N"
    fi
done