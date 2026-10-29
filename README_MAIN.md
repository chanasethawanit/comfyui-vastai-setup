# 🎨 ComfyUI Professional Layer-Based Workflow
## Setup สำหรับ Vast.ai GPU Instances

เครื่องมือสำหรับสร้างภาพ AI แบบมืออาชีพ โดยแยก generation เป็น **layers** เหมือนนักวาดจริง

---

## ✨ Features

- 🎭 **Layer-based Generation** - แยกเส้น, สี, แสง, เงา เป็น layer
- 🎨 **Professional Quality** - คุณภาพระดับมืออาชีพ
- ⚡ **Vast.ai Optimized** - พร้อมใช้งานบน cloud GPU
- 🔧 **Semi-Automatic** - AI ช่วยแต่ยังควบคุมได้
- 💾 **Export ทุก Layer** - PNG แยกกันทุก layer

---

## 📦 สิ่งที่รวมอยู่

### Custom Nodes (10 nodes)
- ComfyUI-Manager
- Impact Pack & Inspire Pack
- ControlNet Preprocessors
- LayerDiffuse
- IPAdapter Plus
- Ultimate SD Upscale
- WAS Node Suite
- Segment Anything
- และอื่นๆ

### Models (~25-30GB)
- **SDXL Base** - foundation model
- **AnimagineXL v3** - anime/illustration
- **ControlNet** - canny, depth, lineart
- **IPAdapter** - style control
- **Upscalers** - 4x UltraSharp
- **LoRAs** - detail enhancement

### Workflows
- `professional_layers_basic.json` - พื้นฐาน (เริ่มต้นที่นี่)
- `professional_layers_advanced.json` - ขั้นสูง (coming soon)

---

## 🚀 Quick Start

### 1. เช่า GPU บน Vast.ai

แนะนำ specs:
- **GPU:** RTX 3090 24GB (~$0.30-0.40/hr)
- **Storage:** 100GB+
- **Template:** PyTorch

[🔗 เช่า GPU ที่ Vast.ai](https://vast.ai)

### 2. ติดตั้ง

```bash
cd /workspace
git clone <your-repo-url> comfyui-setup
cd comfyui-setup
bash install.sh
```

⏱️ ใช้เวลา: 15-25 นาที

### 3. เริ่มใช้งาน

```bash
bash start.sh
```

เปิดเบราว์เซอร์: `http://<vast-ip>:8188`

---

## 📚 Documentation

- [📖 คู่มือการใช้งาน](WORKFLOW_GUIDE.md)
- [🎨 Layer System Guide](WORKFLOW_GUIDE.md#layer-system)
- [⚙️ การปรับแต่ง](WORKFLOW_GUIDE.md#การปรับแต่ง)
- [💡 Tips & Tricks](WORKFLOW_GUIDE.md#tips--tricks)

---

## 🎯 Workflow Overview

```
Input Prompt
    ↓
Base Generation
    ↓
┌─────────────────────┐
│ Layer Extraction    │
├─────────────────────┤
│ 1. Lineart         │
│ 2. Base Colors     │
│ 3. Shadows         │
│ 4. Lighting        │
│ 5. Background      │
│ 6. Effects         │
└─────────────────────┘
    ↓
Compositing
    ↓
Final Output
```

---

## 📂 โครงสร้างไฟล์

```
comfyui-vastai-setup/
├── install.sh              # Installation script
├── download_models.sh      # Model downloader
├── start.sh                # Quick start
├── README.md               # นี่
├── WORKFLOW_GUIDE.md       # คู่มือละเอียด
└── workflows/
    └── professional_layers_basic.json
```

---

## 💰 ค่าใช้จ่าย

| GPU | VRAM | ราคา/ชม. | Speed |
|-----|------|----------|-------|
| RTX 3090 | 24GB | $0.30-0.40 | ⭐ แนะนำ |
| RTX 4090 | 24GB | $0.50-0.70 | ⚡ เร็วสุด |
| RTX 3080 | 10GB | $0.20-0.30 | 💵 ถูกสุด (ต้องลด settings) |

**การใช้งานโดยประมาณ:**
- Setup: ฟรี (ครั้งแรก)
- Generate 1 image: ~2-5 นาที = $0.02-0.04
- 1 ชั่วโมง: สร้างได้ ~15-30 ภาพ

---

## 🐛 Troubleshooting

### Out of memory
```bash
# ลดขนาดภาพใน workflow
# หรือเปลี่ยนไปใช้ GPU ที่ VRAM สูงกว่า
```

### Model not found
```bash
cd /workspace/comfyui-setup
bash download_models.sh
```

### Custom node error
```bash
cd /workspace/ComfyUI/custom_nodes/<folder>
git pull
pip install -r requirements.txt
```

ดูเพิ่มใน [Troubleshooting Guide](WORKFLOW_GUIDE.md#troubleshooting)

---

## 🎓 ตัวอย่าง Output

**Input:**
```
masterpiece, 1girl, blue hair, red eyes, 
school uniform, garden, anime style
```

**Output:**
- `base_generation.png` - ภาพต้นฉบับ
- `layer_01_lineart.png` - เส้นสีดำบนพื้นขาว
- `layer_02_base_color.png` - สีพื้นฐาน
- `final_composite.png` - ภาพสำเร็จ

นำไป composite ต่อใน Photoshop/GIMP ได้เลย!

---

## 📞 Support

- เช็ค [WORKFLOW_GUIDE.md](WORKFLOW_GUIDE.md) ก่อน
- ดู logs: `/workspace/ComfyUI/comfyui.log`
- ตรวจสอบ console output

---

## 🔄 Updates

**Version 1.0** (Current)
- ✅ Basic layer-based workflow
- ✅ Vast.ai optimized
- ✅ 10 custom nodes
- ✅ SDXL + AnimagineXL

**Coming Soon:**
- 🔜 Advanced workflow with ControlNet
- 🔜 More layer types (specular, subsurface, etc)
- 🔜 Batch processing
- 🔜 Video/animation support

---

## 📜 License

MIT License - ใช้งานได้ฟรี

---

## 🙏 Credits

- [ComfyUI](https://github.com/comfyanonymous/ComfyUI)
- [Stable Diffusion XL](https://stability.ai/)
- [AnimagineXL](https://huggingface.co/cagliostrolab/animagine-xl-3.0)
- All custom node developers

---

**Happy Creating! 🎨✨**
