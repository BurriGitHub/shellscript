#!/bin/bash
USERID=$(id -u)
#check to the user root or not
if [ $USERID -ne 0 ];then
        echo "you need to be root user execut this script"
        exit 1
fi
yum install git -y

if [ $? -ne 0 ];then
        echo "installing git is failure"
        exit 1
else
        echo "installing git is success"
fi

