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

# Custom Nodes 설치
# QualityOfLifeSuit_Omar92
RUN cd /ComfyUI/custom_nodes && \
  git clone https://github.com/omar92/ComfyUI-QualityOfLifeSuit_Omar92.git

# In-Context-Lora-Utils
RUN cd /ComfyUI/custom_nodes && \
  git clone https://github.com/lrzjason/Comfyui-In-Context-Lora-Utils.git

# GGUF
RUN cd /ComfyUI/custom_nodes && \
  git clone https://github.com/city96/ComfyUI-GGUF && \
  pip install --upgrade gguf

# AlekPet
RUN cd /ComfyUI/custom_nodes && \
  git clone https://github.com/AlekPet/ComfyUI_Custom_Nodes_AlekPet.git

# inpaint-nodes
RUN cd /ComfyUI/custom_nodes && \
  git clone https://github.com/Acly/comfyui-inpaint-nodes.git \
  && pip install opencv-python

# Image Resize for ComfyUI
RUN cd /ComfyUI/custom_nodes && \
  git clone https://github.com/palant/image-resize-comfyui.git

# ComfyUI fitsize
RUN cd /ComfyUI/custom_nodes && \
  git clone https://github.com/bronkula/comfyui-fitsize.git

# YoloWorld-EfficientSAM
RUN cd /ComfyUI/custom_nodes && \
  git clone https://github.com/ZHO-ZHO-ZHO/ComfyUI-YoloWorld-EfficientSAM.git

# Kep OpenAI
RUN cd /ComfyUI/custom_nodes && \
  git clone https://github.com/M1kep/ComfyUI-KepOpenAI.git && \
  sed -i 's/gpt-4-vision-preview/gpt-4o/g' /ComfyUI/custom_nodes/ComfyUI-KepOpenAI/nodes.py

# layerstyle-advance
RUN cd /ComfyUI/custom_nodes && \
  git clone https://github.com/chflame163/ComfyUI_LayerStyle_Advance.git

# ComfyUI Deploy
RUN cd /ComfyUI/custom_nodes && \
  git clone https://github.com/BennyKok/comfyui-deploy.git

COPY comfyui-flux-s3/pull_s3_models.sh /pull_s3_models.sh
RUN chmod +x /pull_s3_models.sh

COPY comfyui-flux-s3/custom_start.sh /custom_start.sh
RUN chmod +x /custom_start.sh

# 나머지 앱 설정
CMD ["/custom_start.sh"]
