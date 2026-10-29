# ComfyUI Professional Layer-Based Workflow - คู่มือการใช้งาน

## 📖 สารบัญ
1. [ภาพรวม](#ภาพรวม)
2. [การติดตั้งบน Vast.ai](#การติดตั้งบน-vastai)
3. [การใช้งาน Workflow](#การใช้งาน-workflow)
4. [Layer System](#layer-system)
5. [การปรับแต่ง](#การปรับแต่ง)
6. [Tips & Tricks](#tips--tricks)

---

## 🎯 ภาพรวม

Workflow นี้เลียนแบบกระบวนการวาดภาพของนักวาดมืออาชีพ โดยแยก**แต่ละขั้นตอน**ออกเป็น layer:

```
Input Prompt
    ↓
Base Generation (rough composition)
    ↓
┌─────────────────────────────────┐
│  Layer Extraction & Generation  │
├─────────────────────────────────┤
│  1. Lineart Layer               │
│  2. Base Color Layer            │
│  3. Shadow Layer                │
│  4. Lighting Layer              │
│  5. Background Layer            │
│  6. Effects Layer               │
└─────────────────────────────────┘
    ↓
Layer Compositing
    ↓
Final Output (with all layers saved)
```

### ✨ คุณสมบัติ

- ✅ **Layer-based generation** - แต่ละองค์ประกอบแยกกัน
- ✅ **ControlNet support** - ควบคุม composition ด้วย canny/depth/lineart
- ✅ **Semi-automatic** - AI ช่วยแต่คุณยังควบคุมได้
- ✅ **Export แยก layer** - แต่ละ layer เป็น PNG
- ✅ **Professional quality** - คุณภาพระดับมืออาชีพ

---

## 🚀 การติดตั้งบน Vast.ai

### Step 1: เช่า GPU Instance

1. ไปที่ [Vast.ai Console](https://vast.ai/console/create/)
2. กรอง instances:
   - **GPU:** RTX 3090 24GB (แนะนำ) หรือ RTX 4090
   - **Disk Space:** 100GB ขึ้นไป
   - **Bandwidth:** Unlimited (ถ้าเป็นไปได้)
   - **Template:** PyTorch หรือ Ubuntu with CUDA

3. เรียงตามราคา (Price/hr) จากถูกไปแพง
4. กด **RENT** instance ที่ถูกที่สุดที่มี specs ตามต้องการ

💡 **เคล็ดลับ:**
- เลือก "Interruptible" ถ้าไม่รีบ (ถูกกว่า ~30%)
- เลือก region ใกล้คุณ (เร็วกว่า)
- ใช้ filter "Verified" เพื่อหลีกเลี่ยงปัญหา

### Step 2: เข้าถึง Instance

หลังจาก instance พร้อม (status: Running):

**วิธีที่ 1: SSH (แนะนำ)**
```bash
# คัดลอก SSH command จาก Vast.ai console
ssh -p <port> root@<ip-address> -L 8188:localhost:8188
```

**วิธีที่ 2: JupyterLab**
- เปิด JupyterLab URL จาก console
- เปิด Terminal ใน JupyterLab

### Step 3: ติดตั้ง ComfyUI

ใน terminal ของ instance:

```bash
# Clone repository นี้
cd /workspace
git clone <your-repo-url> comfyui-setup
cd comfyui-setup

# รัน installation script
bash install.sh
```

**Script จะทำอัตโนมัติ:**
1. ติดตั้ง ComfyUI
2. ติดตั้ง custom nodes ทั้งหมด (10 nodes)
3. ดาวน์โหลด models (~25-30GB)
4. Import workflows

⏱️ **ใช้เวลา:** 15-25 นาที (ขึ้นอยู่กับความเร็วเน็ต)

### Step 4: เริ่มใช้งาน

```bash
cd /workspace/ComfyUI
python main.py --listen 0.0.0.0 --port 8188
```

เปิดเบราว์เซอร์:
```
http://<vast-instance-ip>:8188
```

> 💡 ดู IP จาก Vast.ai console

---

## 🎨 การใช้งาน Workflow

### เลือก Workflow

มี 2 workflows:

1. **`professional_layers_basic.json`** (แนะนำสำหรับเริ่มต้น)
   - Workflow พื้นฐาน
   - เร็ว, ใช้ VRAM น้อย
   - เหมาะกับการทดลอง

2. **`professional_layers_advanced.json`** (coming soon)
   - ใช้ ControlNet
   - Layer control เต็มรูปแบบ
   - คุณภาพสูงสุด

### วิธีโหลด Workflow

1. เปิด ComfyUI (http://your-ip:8188)
2. กด **"Load"** (มุมขวาบน)
3. เลือกไฟล์: `/workspace/ComfyUI/workflows/professional_layers_basic.json`
4. Workflow จะโหลดขึ้นมา

### ปรับแต่ง Prompts

#### Positive Prompt (node #2)
```
masterpiece, best quality, 1girl, 
anime style, detailed illustration, 
professional artwork, layered composition, 
clean lineart, vibrant colors,
[เพิ่ม description ของคุณที่นี่]
```

**ตัวอย่าง:**
```
masterpiece, best quality, 1girl, blue hair, 
red eyes, school uniform, standing in garden, 
cherry blossoms, soft lighting, anime style, 
detailed illustration, clean lineart
```

#### Negative Prompt (node #3)
```
lowres, bad anatomy, bad hands, text, error, 
missing fingers, extra digit, fewer digits, 
cropped, worst quality, low quality, 
normal quality, jpeg artifacts, signature, 
watermark, username, blurry
```

### กด Generate

1. ตรวจสอบ prompts แล้ว
2. กด **"Queue Prompt"** (มุมขวาบน)
3. รอ generation (~2-5 นาที ขึ้นอยู่กับ GPU)

### ผลลัพธ์

ภาพจะถูกบันทึกใน `/workspace/ComfyUI/output/`:

- `base_generation_xxxxx.png` - ภาพ base ก่อนแยก layer
- `layer_01_lineart_xxxxx.png` - เส้นทั้งหมด
- `layer_02_base_color_xxxxx.png` - สีพื้นฐาน
- `final_composite_xxxxx.png` - ภาพสำเร็จ

---

## 🎭 Layer System

### Layer Types & Blend Modes

| Layer | คำอธิบาย | Blend Mode | ใช้เมื่อ |
|-------|---------|------------|---------|
| **Lineart** | เส้น sketch + clean line | Multiply | เส้นทับสี |
| **Base Color** | สีพื้นฐาน flat | Normal | base layer |
| **Shadow** | เงา soft/hard | Multiply | เพิ่มมิติ |
| **Lighting** | แสง rim light, highlights | Screen/Add | เพิ่มความสว่าง |
| **Background** | พื้นหลัง | Normal | อยู่ล่างสุด |
| **Effects** | particle, bokeh, glow | Overlay/Screen | finishing touches |

### การปรับแต่ง Layer

ใน workflow มี node **ImageBlend** สำหรับแต่ละ layer:

```python
# Parameters
- blend_mode: "multiply", "screen", "overlay", "add", "normal"
- opacity: 0.0 - 1.0
```

**ตัวอย่างการใช้:**

- **Lineart บางเกินไป** → ลด opacity เป็น 0.7
- **Shadow เข้มเกินไป** → เปลี่ยนจาก multiply เป็น overlay
- **Lighting สว่างเกินไป** → ลด opacity หรือเปลี่ยนเป็น add

---

## ⚙️ การปรับแต่ง

### เปลี่ยน Model

แก้ใน node **CheckpointLoaderSimple** (node #1):

- **AnimagineXL** (default) - anime/illustration
- **SDXL Base** - realistic/versatile

### ปรับขนาดภาพ

แก้ใน node **EmptyLatentImage** (node #10):

| Preset | Width | Height | Aspect | ใช้กับ |
|--------|-------|--------|--------|--------|
| Portrait | 1024 | 1536 | 2:3 | character |
| Landscape | 1536 | 1024 | 3:2 | scene |
| Square | 1024 | 1024 | 1:1 | icon/avatar |
| Tall | 832 | 1216 | ~2:3 | ประหยัด VRAM |

> ⚠️ ขนาดใหญ่กว่า 1024x1536 จะใช้ VRAM มาก อาจต้องลด batch size

### ปรับ Generation Settings

ใน node **KSampler** (node #30):

```yaml
seed: 42 (เปลี่ยนเพื่อ variation)
steps: 30 (20-40, สูง = คมชัดแต่ช้า)
cfg: 7 (5-10, สูง = ติด prompt มาก)
sampler_name: "dpmpp_2m_sde" (fast, quality)
scheduler: "karras" (smooth)
```

**แนะนำตาม use case:**

- **Fast draft:** steps=20, cfg=6
- **Balanced:** steps=30, cfg=7 (default)
- **High quality:** steps=40, cfg=8, sampler="dpmpp_2m_sde_gpu"

---

## 💡 Tips & Tricks

### 1. ประหยัด VRAM

ถ้าเจอ "Out of memory":

- ลดขนาดภาพ (1024→832, 1536→1216)
- ลด batch size เป็น 1
- ปิด node ที่ไม่ใช้ (right-click → Bypass)

### 2. เร่งความเร็ว

- ใช้ sampler "euler_a" หรือ "dpmpp_2m" (เร็วกว่า)
- ลด steps เป็น 20-25
- ใช้ xformers (ติดตั้งแล้วใน setup)

### 3. คุณภาพสูงสุด

- เพิ่ม steps เป็น 40-50
- ใช้ sampler "dpmpp_2m_sde_gpu"
- เพิ่ม "highly detailed" ใน positive prompt
- เพิ่ม "low quality, blurry" ใน negative

### 4. Style Consistency

เพิ่ม keywords:

- **Anime:** `anime style, cel shading, clean lineart`
- **Semi-realistic:** `semi-realistic, painterly, soft shading`
- **Watercolor:** `watercolor, soft edges, pastel colors`
- **Digital painting:** `digital painting, brush strokes, textured`

### 5. Character Focus

```
Positive: 1girl, detailed face, detailed eyes, 
         expressive, character focus, portrait

Negative: bad face, bad eyes, deformed face, 
         ugly, disfigured
```

### 6. Background Control

**พื้นหลังเยอะ:**
```
Positive: detailed background, scenery, 
         environmental details
```

**พื้นหลังเบลอ/น้อย:**
```
Positive: simple background, blurred background, 
         white background
Negative: detailed background, busy background
```

---

## 🐛 Troubleshooting

### Model not found
```bash
cd /workspace/comfyui-setup
bash download_models.sh
```

### Custom node error
```bash
cd /workspace/ComfyUI/custom_nodes/<node-folder>
git pull
pip install -r requirements.txt
```

### Out of memory
- ลดขนาดภาพ
- ใช้ GPU ที่ VRAM สูงกว่า
- ปิด browser tabs อื่นๆ

### Generation ช้ามาก
- ตรวจสอบว่าใช้ GPU (ไม่ใช่ CPU)
- ลด steps
- เปลี่ยน sampler ที่เร็วกว่า

### ภาพออกมาแปลกๆ
- เช็ค prompt (มี typo?)
- ลอง seed อื่น (เปลี่ยนจาก 42)
- ปรับ CFG scale (ลองระหว่าง 5-10)

---

## 📦 เก็บไฟล์ก่อนปิด Instance

**สำคัญ!** Vast.ai จะลบข้อมูลเมื่อปิด instance

### วิธีที่ 1: ดาวน์โหลดไฟล์

```bash
# Zip output folder
cd /workspace/ComfyUI
zip -r outputs.zip output/

# Download ผ่าน JupyterLab หรือ SCP
```

### วิธีที่ 2: Upload ไป Cloud Storage

```bash
# Install rclone
curl https://rclone.org/install.sh | sudo bash

# Config rclone สำหรับ Google Drive / Dropbox
rclone config

# Sync output folder
rclone sync /workspace/ComfyUI/output/ mycloud:ComfyUI-Output/
```

### วิธีที่ 3: Save Vast.ai Template

1. ไปที่ Vast.ai Console
2. กด **"Save Template"** ของ instance ที่รัน
3. ครั้งต่อไปเลือก template นี้ (จะมี ComfyUI + models พร้อมแล้ว)

> ⚠️ Template มีค่าใช้จ่ายในการเก็บ (~$0.10/GB/month)

---

## 🎓 เรียนรู้เพิ่มเติม

### Workflow Architecture

```
┌─────────────────┐
│  Input Stage    │
│  - Prompt       │
│  - Model Load   │
│  - Settings     │
└────────┬────────┘
         ↓
┌─────────────────┐
│ Generation      │
│ - KSampler      │
│ - VAE Decode    │
└────────┬────────┘
         ↓
┌─────────────────┐
│ Layer Extract   │
│ - Lineart       │
│ - Color         │
│ - Mask          │
└────────┬────────┘
         ↓
┌─────────────────┐
│ Compositing     │
│ - Blend Layers  │
│ - Save Outputs  │
└─────────────────┘
```

### Custom Nodes ที่ใช้

1. **ControlNet Preprocessors** - แปลงภาพเป็น control maps
2. **LayerDiffuse** - generate layers with transparency
3. **ImageBlend** (WAS Node Suite) - blend layers with modes
4. **Segment Anything** - auto mask generation

### Resources

- [ComfyUI Wiki](https://github.com/comfyanonymous/ComfyUI/wiki)
- [Custom Nodes List](https://github.com/ltdrdata/ComfyUI-Manager)
- [ControlNet Guide](https://github.com/lllyasviel/ControlNet)
- [Stable Diffusion Prompting Guide](https://stable-diffusion-art.com/prompt-guide/)

---

## 📞 Support & Updates

ถ้ามีปัญหาหรือคำถาม:

1. เช็ค Troubleshooting section ก่อน
2. ดู logs: `/workspace/ComfyUI/comfyui.log`
3. ตรวจสอบ ComfyUI console output

---

**Happy Creating! 🎨✨**
