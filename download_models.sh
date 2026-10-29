#!/bin/bash
# Model Download Script - Part 2 of installation
set -e

COMFYUI_DIR="/workspace/ComfyUI"
cd "$COMFYUI_DIR"

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

print_status() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_info() {
    echo -e "${YELLOW}[i]${NC} $1"
}

# Function to download with progress
download_file() {
    local url=$1
    local output=$2
    local desc=$3

    print_info "Downloading $desc..."
    wget -q --show-progress --progress=bar:force:noscroll "$url" -O "$output"
    print_status "$desc downloaded"
}

echo "Starting model downloads..."
echo ""

# 1. SDXL Base Model
print_info "Downloading SDXL base model (6.5GB)..."
cd models/checkpoints
if [ ! -f "sd_xl_base_1.0.safetensors" ]; then
    download_file \
        "https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors" \
        "sd_xl_base_1.0.safetensors" \
        "SDXL Base"
fi

# 2. AnimagineXL (Anime-focused SDXL)
if [ ! -f "animagineXLV3_v30.safetensors" ]; then
    print_info "Downloading AnimagineXL (anime model, 6.5GB)..."
    download_file \
        "https://huggingface.co/cagliostrolab/animagine-xl-3.0/resolve/main/animagineXLV3_v30.safetensors" \
        "animagineXLV3_v30.safetensors" \
        "AnimagineXL v3"
fi

cd "$COMFYUI_DIR"

# 3. VAE
print_info "Downloading VAE..."
cd models/vae
if [ ! -f "sdxl_vae.safetensors" ]; then
    download_file \
        "https://huggingface.co/stabilityai/sdxl-vae/resolve/main/sdxl_vae.safetensors" \
        "sdxl_vae.safetensors" \
        "SDXL VAE"
fi

cd "$COMFYUI_DIR"

# 4. ControlNet Models
print_info "Downloading ControlNet models..."
cd models/controlnet

# Canny
if [ ! -f "control-lora-canny-rank256.safetensors" ]; then
    download_file \
        "https://huggingface.co/stabilityai/control-lora/resolve/main/control-LoRAs-rank256/control-lora-canny-rank256.safetensors" \
        "control-lora-canny-rank256.safetensors" \
        "ControlNet Canny"
fi

# Depth
if [ ! -f "control-lora-depth-rank256.safetensors" ]; then
    download_file \
        "https://huggingface.co/stabilityai/control-lora/resolve/main/control-LoRAs-rank256/control-lora-depth-rank256.safetensors" \
        "control-lora-depth-rank256.safetensors" \
        "ControlNet Depth"
fi

# Lineart
if [ ! -f "control_v11p_sd15_lineart.pth" ]; then
    download_file \
        "https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_lineart.pth" \
        "control_v11p_sd15_lineart.pth" \
        "ControlNet Lineart"
fi

cd "$COMFYUI_DIR"

# 5. IPAdapter
print_info "Downloading IPAdapter models..."
cd models/ipadapter

if [ ! -f "ip-adapter_sdxl_vit-h.safetensors" ]; then
    download_file \
        "https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter_sdxl_vit-h.safetensors" \
        "ip-adapter_sdxl_vit-h.safetensors" \
        "IPAdapter SDXL"
fi

cd "$COMFYUI_DIR/models/clip_vision"

if [ ! -f "CLIP-ViT-H-14-laion2B-s32B-b79K.safetensors" ]; then
    download_file \
        "https://huggingface.co/h94/IP-Adapter/resolve/main/models/image_encoder/model.safetensors" \
        "CLIP-ViT-H-14-laion2B-s32B-b79K.safetensors" \
        "CLIP Vision Model"
fi

cd "$COMFYUI_DIR"

# 6. Upscale Models
print_info "Downloading upscale models..."
cd models/upscale_models

if [ ! -f "4x-UltraSharp.pth" ]; then
    download_file \
        "https://huggingface.co/Kim2091/UltraSharp/resolve/main/4x-UltraSharp.pth" \
        "4x-UltraSharp.pth" \
        "UltraSharp Upscaler"
fi

cd "$COMFYUI_DIR"

# 7. Anime LoRAs
print_info "Downloading anime LoRAs..."
cd models/loras

# Add Details LoRA
if [ ! -f "add_detail.safetensors" ]; then
    download_file \
        "https://civitai.com/api/download/models/87153" \
        "add_detail.safetensors" \
        "Detail Enhancement LoRA"
fi

cd "$COMFYUI_DIR"

# 8. Segment Anything Model
print_info "Downloading Segment Anything model..."
cd models
mkdir -p sams
cd sams

if [ ! -f "sam_vit_h_4b8939.pth" ]; then
    download_file \
        "https://dl.fbaipublicfiles.com/segment_anything/sam_vit_h_4b8939.pth" \
        "sam_vit_h_4b8939.pth" \
        "Segment Anything (SAM)"
fi

cd "$COMFYUI_DIR"

print_status "All models downloaded successfully!"
echo ""
echo "=================================="
echo "✨ Setup Complete!"
echo "=================================="
echo ""
echo "Total storage used: ~25-30GB"
echo ""
echo "To start ComfyUI, run:"
echo "  cd /workspace/ComfyUI"
echo "  python main.py --listen 0.0.0.0 --port 8188"
echo ""
echo "Then open: http://<your-vast-ip>:8188"
echo ""
