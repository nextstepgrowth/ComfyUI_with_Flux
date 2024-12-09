#!/bin/bash
set -e

# 디렉토리 경로 설정
MOUNT_MODELS="/ComfyUI/models"
MOUNT_CUSTOM_NODES="/ComfyUI/custom_nodes"
CACHE_DIR="/tmp/cache"

# 만약 CACHE_DIR이 없다면 생성
if [ ! -d $CACHE_DIR ]; then
  mkdir -p $CACHE_DIR
fi

if [ -z "$S3_BUCKET" ]; then
  echo "Error: S3_BUCKET environment variable is not set."
  exit 1
fi

aws configure list

echo "Sync S3 bucket from: s3://$S3_BUCKET"

aws s3 sync s3://$S3_BUCKET/custom_nodes $MOUNT_CUSTOM_NODES --exact-timestamps
aws s3 sync s3://$S3_BUCKET/models $MOUNT_MODELS --exact-timestamps
