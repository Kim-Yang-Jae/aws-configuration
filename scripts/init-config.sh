#!/bin/bash

LOG_PATH=/home/ubuntu/logs
DEPLOY_PATH=/home/ubuntu/deploy
APP_PATH=/home/ubuntu/apps
SCRIPT_PATH=/home/ubuntu/scripts

echo ">>make directory"
if [ -d $LOG_PATH ]; then
  echo ">>logs folder is already exist"
else
  mkdir $LOG_PATH
fi
if [ -d $DEPLOY_PATH ]; then
  echo ">>deploy folder is already exist"
else
  mkdir $DEPLOY_PATH
fi
if [ -d $APP_PATH ]; then
  echo ">>apps folder is already exist"
else
  mkdir $APP_PATH
fi
if [ -d $SCRIPT_PATH ]; then
  echo ">>scripts folder is already exist"
else
  mkdir $SCRIPT_PATH
fi

echo ">>java check"
rpm -qa | grep jdk >> result.txt
FILE="result.txt"

if [ -s $FILE ];then
  echo ">>java already exist"
else
    sudo apt-get install openjdk-11-jdk
fi
echo ">>end init"