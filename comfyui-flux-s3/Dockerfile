FROM valyriantech/comfyui-without-flux:latest

# Amazon S3 Mountpoint 설치
RUN apt-get update && apt-get install -y \
  curl unzip && \
  curl -LO "https://github.com/awslabs/amazon-s3-mountpoint/releases/latest/download/mount-s3" && \
  chmod +x mount-s3 && \
  mv mount-s3 /usr/local/bin/ && \
  rm -rf /var/lib/apt/lists/*

# 필요한 디렉토리 생성
RUN mkdir -p /workspaces/ComfyUI/models /workspaces/ComfyUI/custom_nodes /tmp/cache

# 마운트 스크립트 복사
COPY mount_s3.sh /scripts/mount_s3.sh
RUN chmod +x /scripts/mount_s3.sh

# 기존 CMD [ "/start.sh" ] 유지
ENTRYPOINT ["/scripts/mount_s3.sh"]
CMD ["/start.sh"]