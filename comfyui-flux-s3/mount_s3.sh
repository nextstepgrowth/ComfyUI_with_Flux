#!/bin/bash
set -e

# 환경 변수에서 S3 버킷 이름 가져오기
if [ -z "$S3_BUCKET" ]; then
    echo "Error: S3_BUCKET 환경 변수가 설정되지 않았습니다. S3 버킷 이름을 전달하세요."
    exit 1
fi

# 디렉토리 경로 설정
MOUNT_MODELS="/workspaces/ComfyUI/models"
MOUNT_CUSTOM_NODES="/workspaces/ComfyUI/custom_nodes"
CACHE_DIR="/tmp/cache"

# S3 Mountpoint로 마운트
echo "Mounting S3 bucket models from: s3://$S3_BUCKET/models"
mount-s3 --cache $CACHE_DIR s3://$S3_BUCKET/models $MOUNT_MODELS

echo "Mounting S3 bucket custom_nodes from: s3://$S3_BUCKET/custom_nodes"
mount-s3 --cache $CACHE_DIR s3://$S3_BUCKET/custom_nodes $MOUNT_CUSTOM_NODES
