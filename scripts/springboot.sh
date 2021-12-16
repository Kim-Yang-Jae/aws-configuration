#!/bin/bash
ACTION=$1
ENV=$2
PRJT_NAME=$3
PORT_NUM=$4

DEPLOY_DIR_PATH=/home/ubuntu/deploy
CURRENT_DEPLOY_DIR_PATH=${DEPLOY_DIR_PATH}/${PRJT_NAME}/current

start() {
  echo ">> server start"
  JAR_FILE=$(basename ${CURRENT_DEPLOY_DIR_PATH}/*.jar)
  nohup java -jar "${CURRENT_DEPLOY_DIR_PATH}/${JAR_FILE}" \
        -Dspring.profiles.active=$ENV -Dsever.port=$PORT_NUM &
}

stop() {
  STOP_PROCESS=$(ps -ef | grep $ENV | grep $PORT_NUM | grep $PRJT_NAME | awk '{print $2}' )
  kill -9 "$STOP_PROCESS"
}

if [ "$ACTION" == "start" ]; then
  start
else
  stop
fi