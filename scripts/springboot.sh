#!/bin/bash
ACTION=$1
ENV=$2
PRJT_NAME=$3
PORT_NUM=$4

DEPLOY_DIR_PATH=/home/ubuntu/deploy
CURRENT_DEPLOY_DIR_PATH=${DEPLOY_DIR_PATH}/${PRJT_NAME}/current

start() {
  echo ">> start method"
  JAR_FILE=$(basename "${CURRENT_DEPLOY_DIR_PATH}"/*.jar)
  echo ">> jar-file-name : $JAR_FILE"
#  sudo chmod 755 "${CURRENT_DEPLOY_DIR_PATH}/${JAR_FILE}"
  nohup java -jar -Dspring.profiles.active="$ENV" -Dsever.port="$PORT_NUM" \
          "${CURRENT_DEPLOY_DIR_PATH}/${JAR_FILE}" &
}

stop() {
  echo ">> stop method"
  STOP_PROCESS=$(ps -ef | grep "$ENV" | grep "$PORT_NUM" | grep "$PRJT_NAME" | awk '{print $2}' )
  sudo kill -9 "$STOP_PROCESS"
}

if [ "$ACTION" == "start" ]; then
  start
else
  stop
fi