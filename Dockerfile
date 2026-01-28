# Ika Studio - Custom ComfyUI worker with animagine-xl
# For RunPod Serverless deployment
FROM runpod/worker-comfyui:3.3.0-base

# Install wget if not present
RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*

# Download animagine-xl-3.1 from HuggingFace (more reliable than Civitai)
RUN wget -q --show-progress --progress=bar:force:noscroll \
    -O /comfyui/models/checkpoints/animagine-xl.safetensors \
    "https://huggingface.co/cagliostrolab/animagine-xl-3.1/resolve/main/animagine-xl-3.1.safetensors"

# Verify download succeeded
RUN ls -lh /comfyui/models/checkpoints/animagine-xl.safetensors && \
    echo "✓ animagine-xl.safetensors downloaded successfully"
