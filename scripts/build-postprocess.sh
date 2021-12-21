#!/bin/bash

PROJECT_NAME=$1

DEPLOY_DIR_PATH=/home/ubuntu/deploy
CURRENT_DEPLOY_DIR_PATH=${DEPLOY_DIR_PATH}/${PROJECT_NAME}/current

TODAY=$(date "+%Y%m%d%H%M%S")

JAR_FILE=$(basename ./build/libs/*.jar)
JAR_FILE_NAME=${JAR_FILE%.*}
CHANGED_JAR_FILE_NAME=${JAR_FILE_NAME}-${TODAY}

echo ">> make project directory"
if [ ! -d ${DEPLOY_DIR_PATH}/${PROJECT_NAME} ]; then
  sudo mkdir ${DEPLOY_DIR_PATH}/${PROJECT_NAME}
fi

echo ">> make jar directory"
if [ ! -d ${DEPLOY_DIR_PATH}/${PROJECT_NAME}/${CHANGED_JAR_FILE_NAME} ]; then
  sudo mkdir ${DEPLOY_DIR_PATH}/${PROJECT_NAME}/${CHANGED_JAR_FILE_NAME}
fi

echo ">> move jar file"
sudo mv ./build/libs/*.jar "${DEPLOY_DIR_PATH}/${PROJECT_NAME}/${CHANGED_JAR_FILE_NAME}/${CHANGED_JAR_FILE_NAME}.jar"


echo ">>make symbolic link"
echo "target-path : ${DEPLOY_DIR_PATH}/${PROJECT_NAME}/${CHANGED_JAR_FILE_NAME}"
echo "link-path : ${CURRENT_DEPLOY_DIR_PATH}"
if [ -d "${CURRENT_DEPLOY_DIR_PATH}" ]; then
  echo ">>symbolic link is already exist"
  sudo rm -f ${CURRENT_DEPLOY_DIR_PATH}
fi
sudo ln -s ${DEPLOY_DIR_PATH}/"${PROJECT_NAME}"/"${CHANGED_JAR_FILE_NAME}" "${CURRENT_DEPLOY_DIR_PATH}"