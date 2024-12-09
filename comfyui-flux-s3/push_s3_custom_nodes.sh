#!/bin/bash
set -e

# 디렉토리 경로 설정
MOUNT_CUSTOM_NODES="/ComfyUI/custom_nodes"

if [ -z "$S3_BUCKET" ]; then
  echo "Error: S3_BUCKET environment variable is not set."
  exit 1
fi

echo "Push custom nodes from: s3://$S3_BUCKET"

aws s3 sync $MOUNT_CUSTOM_NODES s3://$S3_BUCKET/custom_nodes --exact-timestamps
