#!/bin/bash

PROJECT_NAME=$1

DEPLOY_DIR_PATH=/home/ubuntu/deploy
CURRENT_DEPLOY_DIR_PATH=${DEPLOY_DIR_PATH}/${PROJECT_NAME}/current

TODAY=$(date "+%Y%m%d%H%M%S")

JAR_FILE=$(basename ./build/libs/*.jar)
JAR_FILE_NAME=${JAR_FILE%.*}
CHANGED_JAR_FILE_NAME=${JAR_FILE_NAME}-${TODAY}

echo ">> make directory"
if [ ! -d ${DEPLOY_DIR_PATH}/${PROJECT_NAME} ]; then
  mkdir ${DEPLOY_DIR_PATH}/${PROJECT_NAME}
fi

if [ ! -d ${DEPLOY_DIR_PATH}/${PROJECT_NAME}/${CHANGED_JAR_FILE_NAME} ]; then
  mkdir ${DEPLOY_DIR_PATH}/${PROJECT_NAME}/${CHANGED_JAR_FILE_NAME}
fi

echo ">> move jar file"
mv ./build/libs/*.jar ${DEPLOY_DIR_PATH}/${PROJECT_NAME}/"${CHANGED_JAR_FILE_NAME}"/"${CHANGED_JAR_FILE_NAME}".jar


echo ">>make symbolic link"
ln -s "${CURRENT_DEPLOY_DIR_PATH}" ${DEPLOY_DIR_PATH}/"${PROJECT_NAME}"/"${CHANGED_JAR_FILE_NAME}"