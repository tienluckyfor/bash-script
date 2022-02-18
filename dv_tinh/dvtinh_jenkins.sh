#!/bin/bash
source config.sh

echo -e "$Cyan\n Check swap exits.. $Color_Off"
sudo swapon --show
free -h
df -h
echo -e "$Yellow\n Create swap file $Color_Off"
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
echo -e "$Yellow\n Make swap $Color_Off"
sudo mkswap /swapfile
sudo swapon /swapfile
echo -e "$Cyan\n Check again $Color_Off"
sudo swapon --show
free -h
echo -e "$Red\n Permanent $Color_Off"
sudo cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
cat /proc/sys/vm/swappiness

###Setup enviroment for jenkins (jdk)
echo -e "$Red\n from here we will setup enviroment to install jenkins $Color_Off"
echo -e "\n update library \n 'sudo apt update'"
sudo apt update
echo -e "\n search libary \n 'sudo apt search jdk'"
sudo apt search jdk
echo -e "\n install jdk \n 'sudo apt install openjdk-8-jdk'"
sudo apt install openjdk-8-jdk -y
echo -e "\n\n\n\n\n\n check java version \n 'java-version'"
java -version

### install jenkins
echo -e "\n\n\n\n\n add key jenkins in to local \n "
wget -qO - https://pkg.jenkins.io/debian-stable/jenkins.io.key | apt-key add -
echo -e "\n\n\n\n\n\n\n add package in sources.list"
sudo sh -c 'echo deb http:pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
echo -e "\n\n\n\n\n\n\n\n\n update apt \n 'sudo apt-get update'"
sudo apt-get update
echo -e "\n\n\n\n\n\n\n\n\n install jenkins \n 'sudo apt-get install jenkins'"
sudo apt-get install jenkins -y
### get password to login jenkins localhost:8080
cat /var/lib/jenkins/secrets/initialAdminPassword
echo -e "\n\n\n\n\n\n\nsetup composer \n'sudo apt install composer'"
sudo apt install composer -y
##install nginx
sudo apt-get install nginx -y
##install php 7.4 -fpm
sudo apt-get install nginx php7.4-fpm -y
