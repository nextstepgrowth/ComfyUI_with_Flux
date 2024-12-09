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

# custom_nodes 로컬에 있다면 복사
COPY comfyui-flux-s3/custom_nodes /ComfyUI/custom_nodes

# 스크립트 복사
COPY comfyui-flux-s3/pull_s3_custom_nodes.sh /pull_s3_custom_nodes.sh
RUN chmod +x /pull_s3_custom_nodes.sh

# 커스텀 노드 인스톨 스크립트 실행
COPY comfyui-flux-s3/install_custom_nodes.sh /install_custom_nodes.sh
RUN chmod +x /install_custom_nodes.sh

COPY comfyui-flux-s3/custom_start.sh /custom_start.sh
RUN chmod +x /custom_start.sh

# 커스텀 노드 설치 시 아래에 추가

# 예시
# RUN cd / && \
#   git clone https://github.com/ostris/ai-toolkit.git && \
#   cd ai-toolkit && \
#   git submodule update --init --recursive && \
#   pip3 install -r requirements.txt

# 나머지 앱 설정
CMD ["/custom_start.sh"]
