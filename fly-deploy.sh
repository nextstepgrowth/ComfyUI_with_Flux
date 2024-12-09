export $(cat .env | xargs) # .env 파일을 현재 쉘에 환경 변수로 로드

bash ./pull_custom_nodes_local.sh

fly deploy \
  --build-arg AWS_ACCESS_KEY_ID=$(grep AWS_ACCESS_KEY_ID .env | cut -d '=' -f2) \
  --build-arg AWS_SECRET_ACCESS_KEY=$(grep AWS_SECRET_ACCESS_KEY .env | cut -d '=' -f2) \
  --build-arg AWS_REGION=$(grep AWS_REGION .env | cut -d '=' -f2) \
  --build-arg S3_BUCKET=$(grep S3_BUCKET .env | cut -d '=' -f2)
