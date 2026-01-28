# Ika Studio - Custom ComfyUI worker with animagine-xl
# For RunPod Serverless deployment
FROM runpod/worker-comfyui:5.7.1-base

# Download animagine-xl-3.1 from HuggingFace
RUN wget -q --show-progress --progress=bar:force:noscroll \
    -O /comfyui/models/checkpoints/animagine-xl.safetensors \
    "https://huggingface.co/cagliostrolab/animagine-xl-3.1/resolve/main/animagine-xl-3.1.safetensors"

# Verify download succeeded
RUN ls -lh /comfyui/models/checkpoints/animagine-xl.safetensors && \
    echo "✓ animagine-xl.safetensors downloaded successfully"
