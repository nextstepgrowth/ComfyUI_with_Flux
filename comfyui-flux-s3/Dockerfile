FROM valyriantech/comfyui-without-flux:latest

# 필수 패키지 설치
RUN apt-get update && \
  apt-get install -y curl unzip && \
  rm -rf /var/lib/apt/lists/*

# AWS CLI 설치
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
  unzip awscliv2.zip && \
  ./aws/install && \
  rm -rf awscliv2.zip ./aws

ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
ARG AWS_REGION
ARG S3_BUCKET

COPY comfyui-flux-s3/custom_start.sh /custom_start.sh
RUN chmod +x /custom_start.sh

COPY comfyui-flux-s3/pull_s3_models.sh /pull_s3_models.sh
RUN chmod +x /pull_s3_models.sh

# 나머지 앱 설정
CMD ["/custom_start.sh"]
