#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

CHECK_ROOT(){
    if [ $? -ne 0 ]
    then
        echo "Please proceed with the root privileges.."
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "$2.. is failed"
        exit 1
    else
        echo "$2.. is success"

}

CHECK_ROOT

for package in $@
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        echo "$package is not installed, Going to install it.."
        dnf install $package -y
        VALIDATE $? "Installing $package"
    else 
        echo "$package is already installed..nothing to do"
    fi
done