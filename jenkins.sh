#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]; then 
echo "you need to be root user to execute this script"
exit 1
fi
yum update -y
if [ $? -ne 0 ]; then
echo "Updating yum is failure"
exit 1 
else
echo "Updating yum is success"
fi
wget -O /etc/yum.repos.d/jenkins.repo \ 
        https://pkg.jenkins.io/redhat-stable/jenkins.repo
if [ $? -ne 0 ]; then
echo "Adding jenkins repo is failure"
exit 1
else
echo "Adding Jenkins Repo is Success"
fi
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
if [ $? -ne 0 ]; then
echo "Importing Jenkins Key is failure"
exit 1
else
echo "Importing Jenkins key is Success"
fi
 yum upgrade -y
if [ $? -ne 0 ]; then 
echo "Upgrading yum is failure"
exit 1
else
echo "Upgrading is Success"
fi
amazon-linux-extras install java-openjdk11 -y
if [ $? -ne 0 ]; then 
echo "Open JDK 11 installation is failure"
exit 1
else 
echo "Open JDK 11 installtion is Success"
fi
yum install jenkins -y
if  [ $? -ne 0 ]; then 
echo "Jenkins installation is failure"
exit 1
else 
echo "Jenkins installation is Success"
fi 
systemctl enable jenkins
if [ $? -ne 0 ]; then
echo "enableing jenkins is failure"
exit 1
else 
echo "enableing jenkins is Success"
fi
systemctl start jenkins
if [ $? -ne 0 ]; then 
echo "starting jenkins is failure"
exit 1
else 
echo "starting jenkins is Success"
fi 
systemctl status jenkins
if [ $? -ne 0 ]; then 
echo "status jenkins is failure"
exit 1
else 
echo "status jenkins is Success"
fi 
