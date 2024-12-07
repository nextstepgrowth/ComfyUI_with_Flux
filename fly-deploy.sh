#!/bin/bash

# .env 파일 경로
ENV_FILE=".env"

# .env 파일 확인
if [ ! -f $ENV_FILE ]; then
  echo "$ENV_FILE not found!"
  exit 1
fi

# .env 파일 읽어서 build-arg 형식으로 변환
BUILD_ARGS=$(cat $ENV_FILE | xargs -I {} echo "--build-arg {}")

# flyctl deploy 실행
flyctl deploy $BUILD_ARGS
