#!/bin/bash
# Quick Start Script สำหรับ Vast.ai

echo "🚀 ComfyUI Quick Start"
echo ""

cd /workspace/ComfyUI

# Check if already installed
if [ ! -f "main.py" ]; then
    echo "❌ ComfyUI not installed! Run install.sh first."
    exit 1
fi

echo "✅ ComfyUI found"
echo ""

# Start ComfyUI
echo "Starting ComfyUI on port 8188..."
echo ""
echo "📱 Access via: http://$(curl -s ifconfig.me):8188"
echo ""
echo "Press Ctrl+C to stop"
echo ""

python main.py --listen 0.0.0.0 --port 8188
