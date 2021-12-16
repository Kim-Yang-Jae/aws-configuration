#!/bin/bash
ENV=$1
PRJT_NAME=$2
PORT_NUM=$3
STATUS=$4
DEPLOY_DIR_PATH=/home/ubuntu/deploy
CURRENT_DEPLOY_DIR_PATH=${DEPLOY_DIR_PATH}/${PRJT_NAME}/current

start() {
  echo ">> server start"
  nohup java -jar ${CURRENT_DEPLOY_DIR_PATH}/*.jar \
        -Dspring.profiles.active=$ENV -Dsever.port=$PORT_NUM &
}

stop() {
  STOP_PROCESS=$(ps -ef | grep $ENV | grep $PORT_NUM | $grep $PRJT_NAME | awk '{print $2}' )
  kill -9 "$STOP_PROCESS"
}

if [ "$STATUS" == "start" ]; then
  start
else
  stop
fi