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

# 마운트 스크립트 복사
COPY comfyui-flux-s3/sync_s3.sh /sync_s3.sh
RUN chmod +x /sync_s3.sh

# 커스텀 노드 설치 스크립트 복사
COPY comfyui-flux-s3/install_custom_nodes.sh /install_custom_nodes.sh
RUN chmod +x /install_custom_nodes.sh

# 시작 스크립트 복사
COPY comfyui-flux-s3/custom_start.sh /custom_start.sh
RUN chmod +x /custom_start.sh

CMD ["/custom_start.sh"]