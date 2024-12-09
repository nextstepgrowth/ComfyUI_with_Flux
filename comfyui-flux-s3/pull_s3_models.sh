MOUNT_MODELS="/ComfyUI/models"

if [ -z "$S3_BUCKET" ]; then
  echo "Error: S3_BUCKET environment variable is not set."
  exit 1
fi
aws configure set default.s3.max_concurrent_requests 50

echo "Pull models from: s3://$S3_BUCKET/models"

aws s3 sync s3://$S3_BUCKET/models $MOUNT_MODELS --exact-timestamps