#!/bin/bash

echo "pod started"

if [[ $PUBLIC_KEY ]]
then
    mkdir -p ~/.ssh
    chmod 700 ~/.ssh
    cd ~/.ssh
    echo $PUBLIC_KEY >> authorized_keys
    chmod 700 -R ~/.ssh
    cd /
    service ssh start
fi

# Move text-generation-webui's folder to $VOLUME so models and all config will persist
/comfyui-on-workspace.sh

# Launch the UI
python3 /workspace/ComfyUI/main.py --listen

sleep infinity
