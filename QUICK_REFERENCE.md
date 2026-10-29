# 📚 Quick Reference - ComfyUI Layer Workflow

## 🚀 ใช้งานเบื้องต้น (5 นาที)

### 1. เช่า GPU
```
Vast.ai → RTX 3090 24GB → Rent
```

### 2. ติดตั้ง
```bash
cd /workspace && git clone <repo> comfyui-setup
cd comfyui-setup && bash install.sh
```

### 3. เริ่มใช้
```bash
bash start.sh
# เปิด: http://<ip>:8188
```

### 4. Load Workflow
```
ComfyUI → Load → professional_layers_basic.json
```

### 5. Generate!
```
แก้ prompt → Queue Prompt
```

---

## ⌨️ Keyboard Shortcuts

| Key | Function |
|-----|----------|
| `Ctrl + Enter` | Queue Prompt |
| `Ctrl + Shift + Enter` | Queue Prompt (front) |
| `Escape` | Cancel Current |
| `Ctrl + Z` | Undo |
| `Ctrl + Y` | Redo |
| `Space` | Pan canvas |
| `Ctrl + Mouse Wheel` | Zoom |
| `Delete` | Delete selected node |
| `Ctrl + C/V` | Copy/Paste node |
| `Ctrl + D` | Duplicate node |

---

## 🎨 Prompt Templates

### Anime Character
```
Positive:
masterpiece, best quality, 1girl, [hair color] hair, 
[eye color] eyes, [clothing], [pose], [background], 
anime style, detailed, clean lineart, vibrant colors

Negative:
lowres, bad anatomy, bad hands, text, error, 
worst quality, low quality, blurry, watermark
```

### Scene/Background
```
Positive:
masterpiece, scenery, detailed background, 
[environment], [lighting], [mood], 
professional artwork, atmospheric, cinematic

Negative:
low quality, blurry, simple background, 
plain background, boring
```

### Portrait Focus
```
Positive:
masterpiece, portrait, 1girl, detailed face, 
detailed eyes, [expression], character focus, 
upper body, [style], professional lighting

Negative:
bad face, bad eyes, deformed, disfigured, 
ugly, extra limbs, bad anatomy
```

---

## ⚙️ Settings Quick Guide

### Fast Generation (Draft)
```
Steps: 20
CFG: 6
Sampler: euler_a
Size: 832x1216
```

### Balanced (Default)
```
Steps: 30
CFG: 7
Sampler: dpmpp_2m_sde
Size: 1024x1536
```

### High Quality (Final)
```
Steps: 40
CFG: 8
Sampler: dpmpp_2m_sde_gpu
Size: 1024x1536
Upscale: 4x UltraSharp
```

---

## 📐 Image Sizes

| Preset | Width x Height | Ratio | VRAM | Use Case |
|--------|----------------|-------|------|----------|
| Square | 1024 x 1024 | 1:1 | 8GB | Icon, avatar |
| Portrait | 1024 x 1536 | 2:3 | 12GB | Character |
| Landscape | 1536 x 1024 | 3:2 | 12GB | Scene |
| Wide | 1728 x 896 | ~16:9 | 16GB | Wallpaper |
| Tall | 832 x 1216 | 2:3 | 8GB | Mobile |

---

## 🐛 Quick Fixes

### Out of Memory
```bash
# Solution 1: Reduce size
1024x1536 → 832x1216

# Solution 2: Lower batch
batch_size: 1

# Solution 3: Use smaller model
AnimagineXL → SDXL Base
```

### Model Not Found
```bash
cd /workspace/comfyui-setup
bash download_models.sh
```

### Slow Generation
```bash
# Use faster sampler
dpmpp_2m_sde → euler_a

# Reduce steps
30 → 20

# Check GPU usage
nvidia-smi
```

### Bad Quality
```bash
# Increase CFG
CFG: 7 → 8-9

# Add detail keywords
"highly detailed, intricate, sharp focus"

# Try different seed
Change seed number
```

---

## 💰 Cost Calculator

| GPU | $/hr | 1 Image | 10 Images | 1 Hour |
|-----|------|---------|-----------|--------|
| RTX 3090 | $0.35 | $0.02 | $0.20 | 18 images |
| RTX 4090 | $0.60 | $0.01 | $0.15 | 40 images |

**Assumptions:**
- 3 min/image (RTX 3090)
- 1.5 min/image (RTX 4090)
- Includes generation + layer extraction

---

## 📂 Output Files

```
/workspace/ComfyUI/output/
├── base_generation_00001.png      # ภาพต้นฉบับ
├── layer_01_lineart_00001.png     # เส้น
├── layer_02_base_color_00001.png  # สีพื้น
└── final_composite_00001.png      # ภาพสำเร็จ
```

**ดาวน์โหลด:**
```bash
# Zip all outputs
cd /workspace/ComfyUI
zip -r my_outputs.zip output/

# Download via JupyterLab หรือ SCP
```

---

## 🎯 Layer Blend Modes

| Mode | Effect | Use For |
|------|--------|---------|
| Normal | ทับ 100% | Base layers |
| Multiply | คูณ (เข้ม) | Shadows, lineart |
| Screen | สว่างขึ้น | Lighting, glow |
| Overlay | Contrast | Texture, details |
| Add | บวก (แรง) | Bright effects |
| Soft Light | นุ่ม | Subtle shading |

---

## 🔧 Troubleshooting Flowchart

```
Problem?
    ↓
┌─────────────────┐
│ Out of Memory?  │ → ลดขนาด/batch
├─────────────────┤
│ Slow?           │ → ลด steps/เปลี่ยน sampler
├─────────────────┤
│ Bad quality?    │ → เพิ่ม CFG/steps, ปรับ prompt
├─────────────────┤
│ Model error?    │ → Re-run download_models.sh
├─────────────────┤
│ Node error?     │ → git pull custom nodes
└─────────────────┘
```

---

## 📞 Emergency Commands

```bash
# Restart ComfyUI
pkill -f main.py
cd /workspace/ComfyUI && python main.py --listen 0.0.0.0 --port 8188

# Check GPU
nvidia-smi

# Check disk space
df -h

# Check logs
tail -f /workspace/ComfyUI/comfyui.log

# Re-download models
cd /workspace/comfyui-setup && bash download_models.sh

# Update all custom nodes
cd /workspace/ComfyUI/custom_nodes
for d in */; do cd "$d" && git pull && cd ..; done
```

---

## 📖 Learn More

- Full Guide: [WORKFLOW_GUIDE.md](WORKFLOW_GUIDE.md)
- Setup: [README.md](README.md)
- Advanced: [TODO.md](TODO.md) (roadmap)

---

**Bookmark this page for quick reference! 🔖**
