FROM valyriantech/comfyui-without-flux:latest

# 필수 패키지 설치
RUN apt-get update && \
  apt-get install -y \
  curl \
  unzip \
  && rm -rf /var/lib/apt/lists/*

# AWS CLI 설치
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
  unzip awscliv2.zip && \
  ./aws/install && \
  rm -rf awscliv2.zip ./aws

# AWS CLI 버전 확인
RUN aws --version

ARG AWS_ACCESS_KEY_ID
ENV AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}

ARG AWS_SECRET_ACCESS_KEY
ENV AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}

ARG AWS_REGION
ENV AWS_REGION=${AWS_REGION}

ARG S3_BUCKET
ENV S3_BUCKET=${S3_BUCKET}

# 마운트 스크립트 복사
COPY comfyui-flux-s3/mount_s3.sh /scripts/mount_s3.sh
RUN chmod +x /scripts/mount_s3.sh
RUN "/scripts/mount_s3.sh"

CMD ["/start.sh"]