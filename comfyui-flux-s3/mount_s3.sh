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

echo "Sync S3 bucket from: s3://$S3_BUCKET"

aws s3 sync /$MOUNT_CUSTOM_NODES s3://$S3_BUCKET/custom_nodes --exact-timestamps
aws s3 sync /$MOUNT_MODELS s3://$S3_BUCKET/models --exact-timestamps
