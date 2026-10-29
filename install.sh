#!/bin/bash
set -e

echo "=================================="
echo "🚀 ComfyUI Professional Setup"
echo "   For Vast.ai GPU Instances"
echo "=================================="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Workspace directory
WORKSPACE="/workspace"
COMFYUI_DIR="$WORKSPACE/ComfyUI"

# Function to print status
print_status() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

print_info() {
    echo -e "${YELLOW}[i]${NC} $1"
}

# Check if running on Vast.ai or similar
if [ ! -d "$WORKSPACE" ]; then
    print_info "Creating workspace directory..."
    mkdir -p "$WORKSPACE"
fi

cd "$WORKSPACE"

# 1. Install system dependencies
print_info "Installing system dependencies..."
apt-get update -qq
apt-get install -y git wget curl python3-pip ffmpeg libsm6 libxext6 > /dev/null 2>&1
print_status "System dependencies installed"

# 2. Clone ComfyUI
if [ ! -d "$COMFYUI_DIR" ]; then
    print_info "Cloning ComfyUI..."
    git clone https://github.com/comfyanonymous/ComfyUI.git
    print_status "ComfyUI cloned"
else
    print_status "ComfyUI already exists"
fi

cd "$COMFYUI_DIR"

# 3. Install ComfyUI requirements
print_info "Installing ComfyUI requirements..."
pip install -q --upgrade pip
pip install -q torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121
pip install -q -r requirements.txt
print_status "ComfyUI requirements installed"

# 4. Create directory structure
print_info "Setting up directory structure..."
mkdir -p custom_nodes
mkdir -p models/checkpoints
mkdir -p models/loras
mkdir -p models/controlnet
mkdir -p models/vae
mkdir -p models/clip
mkdir -p models/clip_vision
mkdir -p models/ipadapter
mkdir -p models/upscale_models
mkdir -p output
print_status "Directory structure created"

# 5. Install Custom Nodes
print_info "Installing custom nodes (this may take 10-15 minutes)..."

cd custom_nodes

# ComfyUI Manager
if [ ! -d "ComfyUI-Manager" ]; then
    print_info "  → ComfyUI-Manager..."
    git clone -q https://github.com/ltdrdata/ComfyUI-Manager.git
    pip install -q -r ComfyUI-Manager/requirements.txt
    print_status "  ComfyUI-Manager installed"
fi

# Impact Pack
if [ ! -d "ComfyUI-Impact-Pack" ]; then
    print_info "  → Impact Pack..."
    git clone -q https://github.com/ltdrdata/ComfyUI-Impact-Pack.git
    cd ComfyUI-Impact-Pack
    git submodule update --init --recursive
    pip install -q -r requirements.txt
    cd ..
    print_status "  Impact Pack installed"
fi

# Inspire Pack
if [ ! -d "ComfyUI-Inspire-Pack" ]; then
    print_info "  → Inspire Pack..."
    git clone -q https://github.com/ltdrdata/ComfyUI-Inspire-Pack.git
    pip install -q -r ComfyUI-Inspire-Pack/requirements.txt
    print_status "  Inspire Pack installed"
fi

# ControlNet Aux (Preprocessors)
if [ ! -d "comfyui_controlnet_aux" ]; then
    print_info "  → ControlNet Preprocessors..."
    git clone -q https://github.com/Fannovel16/comfyui_controlnet_aux.git
    pip install -q -r comfyui_controlnet_aux/requirements.txt
    print_status "  ControlNet Preprocessors installed"
fi

# LayerDiffuse
if [ ! -d "ComfyUI-layerdiffuse" ]; then
    print_info "  → LayerDiffuse..."
    git clone -q https://github.com/huchenlei/ComfyUI-layerdiffuse.git
    print_status "  LayerDiffuse installed"
fi

# Advanced ControlNet
if [ ! -d "ComfyUI-Advanced-ControlNet" ]; then
    print_info "  → Advanced ControlNet..."
    git clone -q https://github.com/Kosinkadink/ComfyUI-Advanced-ControlNet.git
    print_status "  Advanced ControlNet installed"
fi

# IPAdapter Plus
if [ ! -d "ComfyUI_IPAdapter_plus" ]; then
    print_info "  → IPAdapter Plus..."
    git clone -q https://github.com/cubiq/ComfyUI_IPAdapter_plus.git
    print_status "  IPAdapter Plus installed"
fi

# Ultimate SD Upscale
if [ ! -d "ComfyUI_UltimateSDUpscale" ]; then
    print_info "  → Ultimate SD Upscale..."
    git clone -q https://github.com/ssitu/ComfyUI_UltimateSDUpscale.git
    print_status "  Ultimate SD Upscale installed"
fi

# WAS Node Suite
if [ ! -d "was-node-suite-comfyui" ]; then
    print_info "  → WAS Node Suite..."
    git clone -q https://github.com/WASasquatch/was-node-suite-comfyui.git
    pip install -q -r was-node-suite-comfyui/requirements.txt
    print_status "  WAS Node Suite installed"
fi

# Segment Anything
if [ ! -d "ComfyUI_Segment_Anything" ]; then
    print_info "  → Segment Anything..."
    git clone -q https://github.com/storyicon/comfyui_segment_anything.git ComfyUI_Segment_Anything
    pip install -q -r ComfyUI_Segment_Anything/requirements.txt
    print_status "  Segment Anything installed"
fi

cd "$COMFYUI_DIR"

print_status "All custom nodes installed!"

echo ""
echo "=================================="
echo "📦 Downloading Models..."
echo "=================================="
echo ""

# 6. Download models
print_info "Now downloading models..."
bash "$(dirname "$0")/download_models.sh"

echo ""
echo "=================================="
echo "✅ Installation Complete!"
echo "=================================="
echo ""
echo "Next steps:"
echo "1. Start ComfyUI:"
echo "   cd /workspace/ComfyUI"
echo "   python main.py --listen 0.0.0.0 --port 8188"
echo ""
echo "2. Open browser: http://<your-vast-ip>:8188"
echo ""
echo "3. Load workflow: workflows/professional_layers.json"
echo ""
