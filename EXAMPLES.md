# 🎨 Example Prompts - ComfyUI Layer Workflow

ตัวอย่าง prompts ที่ทดสอบแล้วใช้งานได้ดี

---

## 📷 Character Portraits

### Example 1: School Girl
```yaml
Positive:
masterpiece, best quality, 1girl, blue hair, red eyes, 
school uniform, white shirt, blue skirt, black ribbon, 
smiling, looking at viewer, upper body, outdoors, 
cherry blossoms, spring, anime style, clean lineart, 
vibrant colors, detailed face, detailed eyes

Negative:
lowres, bad anatomy, bad hands, text, error, 
missing fingers, cropped, worst quality, low quality, 
jpeg artifacts, signature, watermark, blurry, 
bad face, deformed eyes

Settings:
Size: 1024x1536
Steps: 30
CFG: 7.5
Seed: 12345
```

### Example 2: Fantasy Character
```yaml
Positive:
masterpiece, best quality, 1girl, silver white hair, 
long hair, blue eyes, elf ears, fantasy outfit, 
armor, standing, forest background, magic particles, 
glowing effects, detailed illustration, anime style, 
cinematic lighting, sharp focus

Negative:
lowres, bad anatomy, bad hands, text, error, 
worst quality, low quality, normal quality, 
jpeg artifacts, blurry, ugly, deformed

Settings:
Size: 1024x1536
Steps: 35
CFG: 8
Seed: 67890
```

### Example 3: Casual Modern
```yaml
Positive:
masterpiece, 1girl, brown hair, ponytail, 
brown eyes, casual clothes, hoodie, jeans, 
sneakers, holding coffee cup, sitting, cafe, 
window, sunlight, cozy atmosphere, anime style, 
soft colors, relaxed pose, detailed

Negative:
lowres, bad anatomy, worst quality, low quality, 
blurry, bad hands, text, watermark, signature

Settings:
Size: 1024x1024
Steps: 28
CFG: 7
Seed: 11111
```

---

## 🏞️ Scenes & Backgrounds

### Example 4: Beach Scene
```yaml
Positive:
masterpiece, best quality, 1girl, bikini, 
long hair flowing, ocean, beach, blue sky, 
summer, sunny day, standing in water, 
water splashing, detailed background, 
anime style, vibrant colors, cinematic

Negative:
lowres, bad anatomy, worst quality, low quality, 
simple background, blurry, bad proportions

Settings:
Size: 1536x1024
Steps: 30
CFG: 7
Seed: 22222
```

### Example 5: Night City
```yaml
Positive:
masterpiece, scenery, night city, neon lights, 
cyberpunk, tall buildings, rain, wet street, 
reflections, atmospheric, cinematic lighting, 
detailed architecture, anime style background, 
moody, dark

Negative:
low quality, blurry, simple, plain, 
overexposed, bad perspective

Settings:
Size: 1728x896
Steps: 35
CFG: 7.5
Seed: 33333
```

---

## 💫 Action & Dynamic

### Example 6: Action Pose
```yaml
Positive:
masterpiece, 1girl, action pose, jumping, 
dynamic angle, motion blur, magic effects, 
glowing hands, determined expression, 
flowing hair and clothes, dramatic lighting, 
anime style, detailed, epic, cinematic

Negative:
lowres, bad anatomy, static pose, stiff, 
worst quality, low quality, blurry, 
bad proportions

Settings:
Size: 1024x1536
Steps: 40
CFG: 8
Seed: 44444
```

---

## 🎭 Specific Styles

### Example 7: Watercolor Style
```yaml
Positive:
masterpiece, watercolor style, 1girl, 
soft edges, pastel colors, gentle brushstrokes, 
artistic, dreamy atmosphere, flower field, 
light particles, ethereal, delicate, 
traditional media style

Negative:
photo realistic, 3d render, digital harsh edges, 
low quality, blurry, muddy colors

Settings:
Size: 1024x1536
Steps: 32
CFG: 6.5
Seed: 55555
```

### Example 8: Cel Shaded Anime
```yaml
Positive:
masterpiece, cel shaded, anime screenshot, 
1girl, bold outlines, flat colors, 
clean shadows, anime style, sharp lines, 
vibrant, high contrast, studio quality

Negative:
soft shading, gradient, realistic, 
photo, 3d, blurry, low quality

Settings:
Size: 1024x1536
Steps: 25
CFG: 7
Seed: 66666
```

---

## 🌸 Seasonal Themes

### Example 9: Spring Cherry Blossoms
```yaml
Positive:
masterpiece, 1girl, spring, cherry blossoms, 
petals falling, pink theme, soft lighting, 
peaceful, park, blue sky, warm colors, 
gentle breeze, anime style, detailed background

Negative:
dark, gloomy, winter, low quality, blurry

Settings:
Size: 1024x1536
Steps: 30
CFG: 7
Seed: 77777
```

### Example 10: Winter Snow
```yaml
Positive:
masterpiece, 1girl, winter outfit, coat, scarf, 
snow falling, cold, white landscape, 
breath visible, cozy, warm colors on cold bg, 
detailed snow, anime style, atmospheric

Negative:
summer, hot, desert, low quality, blurry

Settings:
Size: 1024x1536
Steps: 32
CFG: 7.5
Seed: 88888
```

---

## 🎨 Advanced Compositions

### Example 11: Multiple Characters
```yaml
Positive:
masterpiece, 2girls, friends, contrasting designs, 
one blonde one brunette, different outfits, 
standing together, smiling, looking at each other, 
detailed faces, anime style, good composition, 
balanced, outdoor background

Negative:
bad anatomy, fused characters, extra limbs, 
deformed, worst quality, low quality, blurry

Settings:
Size: 1536x1024
Steps: 35
CFG: 8
Seed: 99999
```

### Example 12: Close-up Detail
```yaml
Positive:
masterpiece, close-up, 1girl, face focus, 
detailed eyes, detailed skin, eyelashes, 
lips, jewelry, hair strands, bokeh background, 
professional lighting, anime style, 
extremely detailed, sharp focus, portrait

Negative:
bad face, bad eyes, simple, low detail, 
blurry, worst quality, deformed face

Settings:
Size: 1024x1024
Steps: 40
CFG: 8.5
Seed: 10101
```

---

## 💡 Tips สำหรับการเขียน Prompt

### Structure ที่ดี:
```
[quality tags], [character count + features], 
[clothing/accessories], [pose/action], 
[setting/background], [lighting/atmosphere], 
[style], [detail level]
```

### Keywords ที่ช่วยเพิ่มคุณภาพ:
```
masterpiece, best quality, highly detailed, 
sharp focus, professional, intricate, 
cinematic lighting, vibrant colors
```

### Keywords ที่ควรใส่ negative:
```
lowres, bad anatomy, bad hands, text, error, 
worst quality, low quality, jpeg artifacts, 
blurry, cropped, watermark, signature, username
```

### ปรับ weight ของ keyword:
```
(keyword:1.2)  → เน้นมากขึ้น
(keyword:0.8)  → ลดความเน้น
(keyword)      → ปกติ
```

**ตัวอย่าง:**
```
(highly detailed:1.3), (masterpiece:1.2), 1girl, 
(simple background:0.7)
```

---

## 🔄 Seed Patterns

### สร้าง Variations:
```
Original seed: 12345

Variations:
- 12346 (slight change)
- 12445 (more change)
- 13345 (different but similar)
- 22345 (quite different)
```

### Random Seed Strategy:
```
1. Generate with random seed
2. ถ้าชอบ → note seed number
3. ปรับ prompt เล็กน้อย
4. ใช้ seed เดิม → ได้ variation คล้ายๆ กัน
```

---

## 📊 Quality Comparison

| Setting | Quality | Speed | VRAM | Best For |
|---------|---------|-------|------|----------|
| Draft | ⭐⭐ | ⚡⚡⚡ | 8GB | Testing prompts |
| Normal | ⭐⭐⭐⭐ | ⚡⚡ | 12GB | General use |
| High | ⭐⭐⭐⭐⭐ | ⚡ | 16GB+ | Final outputs |

---

**ลองใช้ prompts เหล่านี้แล้วปรับแต่งตามความชอบ! 🎨**

มี prompt ที่ชอบ? แชร์กลับมาเพิ่มใน collection นี้!
