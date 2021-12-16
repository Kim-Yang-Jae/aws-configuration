#!/usr/bin/env bash

echo ">>install jenkins"
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo rm /var/lib/dpkg/info/*
sudo dpkg --configure -a
sudo apt update -y
apt-get install jenkins
service jenkins start