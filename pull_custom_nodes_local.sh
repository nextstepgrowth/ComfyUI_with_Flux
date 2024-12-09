#!/bin/bash
set -e

# 디렉토리 경로 설정
MOUNT_CUSTOM_NODES="./comfyui-flux-s3/custom_nodes"

# .env 파일이 존재하는지 확인
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
else
  echo ".env file not found!"
  exit 1
fi

# 확인용 출력
echo "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}"
echo "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}"
echo "S3_BUCKET=${S3_BUCKET}"
echo "AWS_REGION=${AWS_REGION}"

if [ -z "$S3_BUCKET" ]; then
  echo "Error: S3_BUCKET environment variable is not set."
  exit 1
fi

echo "Pull custom nodes from: s3://$S3_BUCKET"

# __pycache__ 및 기타 필요 없는 파일 제외
aws s3 sync s3://$S3_BUCKET/custom_nodes $MOUNT_CUSTOM_NODES \
  --exact-timestamps \
  --exclude "__pycache__/*" \
  --exclude "*.pyc" \
  --exclude "*.pyo" \
  --exclude "*.pyd" \
  --exclude "*.log" \
  --exclude "node_modules/*" \
