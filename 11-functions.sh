#!/bin/bash

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
        echo "$2..is failed"
        exit 1
    else
        echo "$2..is success"
    fi
}


CHECK_ROOT

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "Mysql is not installed..Going to install.."
    dnf install mysql -y
    VALIDATE $? mysql
else
    echo "Mysql is already installed"
fi
