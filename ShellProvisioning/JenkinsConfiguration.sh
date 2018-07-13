#!/usr/bin/env bash

# BEGIN ########################################################################
echo -e "-- ----------------------------- --\n"
echo -e "-- BEGIN PROVISION CONFIGURATION --\n"
echo -e "-- ----------------------------- --\n"

# VARIABLES ####################################################################
echo -e "-- Setting global variables\n"
VIRTUAL_HOST=localhost

# SILENCE stdin message ########################################################
export DEBIAN_FRONTEND=noninteractive
# BOX ##########################################################################
echo -e "-- Get JDK8 repository\n"
sudo add-apt-repository ppa:openjdk-r/ppa
echo -e "-- Get Jenkins Package Signer key\n"
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add - > /dev/null 2>&1
echo -e "-- For Jenkins - Add an entry in your /etc/apt/sources.list\n"
sudo echo "deb http://pkg.jenkins-ci.org/debian binary/" | sudo tee -a /etc/apt/sources.list
echo -e "-- Updating all repository packages list\n"
sudo apt-get update -y -qq

# Install JAVA #########################################################################
echo -e "-- Installing JAVA packages\n"
sudo apt-get install -y openjdk-8-jdk > /dev/null 2>&1

# Install Git Client #########################################################################
echo -e "-- Installing Git Client\n"
sudo apt-get install git -y -qq

# Install Maven Client #########################################################################
echo -e "-- Installing Maven Client\n"
sudo apt-get install -y maven -qq

# Install JENKINS #########################################################################
echo -e "-- Installing Jenkins automation server\n"
apt-get install jenkins -y -qq
echo -e "-- Fix any dependencies\n"
sudo apt-get -y install -f

# Configura JENKINS #########
echo -e "-- Jenkins Stop -----\n"
sudo /etc/init.d/jenkins stop
# echo -e "-- Configure Jenkins:  New port and disable security -----\n"
# echo -e $CI_USER
# #sudo sed -i "s/JENKINS_USER=jenkins/JENKINS_USER=$CI_USER/g"     /etc/default/jenkins
sudo sed -i 's/HTTP_PORT=8080/HTTP_PORT=8000/g'               /etc/default/jenkins
sudo sed -i 's/-Djava.awt.headless=true/-Djava.awt.headless=true -Djenkins.install.runSetupWizard=false/g'  /etc/default/jenkins
echo -e "-- Start Jenkins -----\n"
sudo /etc/init.d/jenkins start

# Firewall ports allows #####################################################
echo -e "-- Firewall ports allow 8000, 8080, 22, 443, 8443\n"
sudo ufw allow 8000
sudo ufw allow 8080
sudo ufw allow 22
sudo ufw allow 443
sudo ufw allow 8443

# Current IP in used #####################################################
echo -e "-- List all IPAddress assigned including the loopback 127.0.0.1\n"
ip -4 addr | grep -oP '(?<=inet\s)\d+(\.\d+){3}'

# END ##########################################################################
echo -e "-- ---------------------------- --\n"
echo -e "-- END PROVISION CONFIGURATION  --\n"
echo -e "-- ---------------------------- --\n"
