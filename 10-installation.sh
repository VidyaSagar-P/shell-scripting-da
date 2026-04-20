#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Please proceed with the root privileges"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "Mysql is not installed..Going to install.."
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "Error..Please check the command inside the script"
        exit 1
    else
        echo "Mysql is installed successfully.."
    fi
else
    echo "Mysql is already installed"
fi