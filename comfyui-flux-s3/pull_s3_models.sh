MOUNT_MODELS="/ComfyUI/models"

if [ -z "$BUCKET_NAME" ]; then
  echo "Error: BUCKET_NAME environment variable is not set."
  exit 1
fi
aws configure set default.s3.max_concurrent_requests 100

echo "Pull models from: s3://$BUCKET_NAME/models"
aws s3 sync s3://$BUCKET_NAME/models $MOUNT_MODELS --exact-timestamps  --exclude "*/Florence/*"  &> sync_pull.log &