# ComfyUI Professional Layer-Based Workflow
Setup สำหรับ Vast.ai - สร้างภาพ AI แบบมืออาชีพด้วย layer system

## โครงสร้าง Repository

```
comfyui-vastai-setup/
├── README.md                    # คุณอยู่ที่นี่
├── README_MAIN.md               # Full documentation
├── WORKFLOW_GUIDE.md            # คู่มือการใช้งานละเอียด
├── QUICK_REFERENCE.md           # Reference ฉบับย่อ
├── EXAMPLES.md                  # ตัวอย่าง prompts
├── TODO.md                      # Roadmap & upcoming features
│
├── install.sh                   # ติดตั้ง ComfyUI + custom nodes
├── download_models.sh           # ดาวน์โหลด models ทั้งหมด
├── start.sh                     # Quick start ComfyUI
│
└── workflows/
    └── professional_layers_basic.json
```

## 🚀 Quick Start

### 1. เช่า GPU บน Vast.ai
- GPU: RTX 3090 24GB (~$0.30-0.40/hr)
- Storage: 100GB+

### 2. ติดตั้ง
```bash
cd /workspace
git clone <your-repo-url> comfyui-setup
cd comfyui-setup
bash install.sh
```

### 3. เริ่มใช้งาน
```bash
bash start.sh
# เปิด: http://<vast-ip>:8188
```

### 4. Load Workflow
```
ComfyUI → Load → workflows/professional_layers_basic.json
```

## 📚 Documentation

| ไฟล์ | เนื้อหา | เหมาะกับ |
|-----|---------|---------|
| [README_MAIN.md](README_MAIN.md) | Full overview, features | ดูภาพรวมทั้งหมด |
| [WORKFLOW_GUIDE.md](WORKFLOW_GUIDE.md) | คู่มือละเอียด, setup | เริ่มต้นใช้งาน |
| [QUICK_REFERENCE.md](QUICK_REFERENCE.md) | Shortcuts, quick fixes | ใช้งานประจำ |
| [EXAMPLES.md](EXAMPLES.md) | Prompt examples | หา inspiration |
| [TODO.md](TODO.md) | Roadmap, upcoming | ดู features ใหม่ |

## ✨ Features

- 🎭 **Layer-based Generation** - แยกเส้น, สี, แสง, เงา
- ⚡ **Vast.ai Optimized** - พร้อมใช้บน cloud GPU
- 🎨 **Professional Quality** - คุณภาพระดับมืออาชีพ
- 💾 **Export Layers** - PNG แยกทุก layer
- 🔧 **10 Custom Nodes** - ครบทุกเครื่องมือ

## 🎨 Workflow Output

```
Input: "1girl, blue hair, red eyes, anime style"
    ↓
Outputs:
├── base_generation.png          # ภาพต้นฉบับ
├── layer_01_lineart.png         # เส้น
├── layer_02_base_color.png      # สีพื้น
└── final_composite.png          # ภาพสำเร็จ
```

## 🛠️ ติดตั้งอะไรบ้าง?

### Custom Nodes (10 nodes)
- ComfyUI-Manager
- Impact Pack & Inspire Pack
- ControlNet Preprocessors
- LayerDiffuse, IPAdapter Plus
- Ultimate SD Upscale
- WAS Node Suite
- Segment Anything

### Models (~25-30GB)
- SDXL Base + AnimagineXL v3
- ControlNet (canny, depth, lineart)
- IPAdapter, Upscalers, LoRAs

## 💰 ค่าใช้จ่าย

| GPU | ราคา/ชม. | 1 ภาพ | 1 ชม. |
|-----|----------|-------|-------|
| RTX 3090 | $0.35 | $0.02 | ~18 ภาพ |
| RTX 4090 | $0.60 | $0.01 | ~40 ภาพ |

## 🐛 Troubleshooting

### Out of Memory
```bash
# ลดขนาดภาพ: 1024x1536 → 832x1216
# หรือเปลี่ยน GPU ที่ VRAM สูงกว่า
```

### Model Not Found
```bash
bash download_models.sh
```

### ดู logs
```bash
tail -f /workspace/ComfyUI/comfyui.log
```

## 📞 ต้องการความช่วยเหลือ?

1. อ่าน [WORKFLOW_GUIDE.md](WORKFLOW_GUIDE.md)
2. เช็ค [QUICK_REFERENCE.md](QUICK_REFERENCE.md)
3. ดู logs

## 🔄 Version

**Current:** v1.0 - Basic layer workflow  
**Next:** v1.1 - Advanced layers + ControlNet

ดู [TODO.md](TODO.md) สำหรับ roadmap

## 📜 License

MIT License

---

**เริ่มต้นที่ [README_MAIN.md](README_MAIN.md) หรือ [WORKFLOW_GUIDE.md](WORKFLOW_GUIDE.md)**

Happy Creating! 🎨✨
