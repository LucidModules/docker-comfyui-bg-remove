FROM runpod/worker-comfyui:5.1.0-base

RUN comfy-node-install comfyui-inspyrenet-rembg

# download models using comfy-cli
# the "--filename" is what you use in your ComfyUI workflow
# RUN comfy model download --url https://huggingface.co/Kim2091/AnimeSharp/resolve/main/4x-AnimeSharp.safetensors --relative-path models/checkpoints --filename 4x-AnimeSharp.safetensors
RUN comfy model download --url https://huggingface.co/Kim2091/AnimeSharp/resolve/main/4x-AnimeSharp.pth --relative-path models/upscale_models --filename 4x-AnimeSharp.pth

# Copy local static input files into the ComfyUI input directory (delete if not needed)
# Assumes you have an 'input' folder next to your Dockerfile
#COPY input/ /comfyui/input/