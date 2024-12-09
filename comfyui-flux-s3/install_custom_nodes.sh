# /ComfyUI/custom_nodes 에 있는 모든 폴더에 들어가서,
# `pip install -r requirements.txt` 실행
for d in /ComfyUI/custom_nodes/*; do
    if [ -d "$d" ]; then
        echo "Installing custom node $d"
        cd $d
        # Check if requirements.txt exists
        if [ ! -f "requirements.txt" ]; then
            echo "No requirements.txt found in $d"
            continue
        fi
        pip install -r requirements.txt
    fi
done
