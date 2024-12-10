MOUNT_MODELS="/ComfyUI/models"

if [ -z "$S3_BUCKET" ]; then
  echo "Error: S3_BUCKET environment variable is not set."
  exit 1
fi

echo "Push models from: s3://$S3_BUCKET/models"

aws s3 sync $MOUNT_MODELS s3://$S3_BUCKET/models --exact-timestamps  --exclude "*/Florence/*"