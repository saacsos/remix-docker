# 🚀 Remix.js with Docker Development Environment

โครงการนี้เป็นแม่แบบสำหรับการพัฒนา Remix.js ด้วย Docker และ VS Code DevContainer ที่มีการตั้งค่าพร้อมสำหรับการพัฒนา

## 📋 คุณสมบัติ

- ⚡ Remix.js with Vite
- 🐳 Docker และ Docker Compose
- 💼 VS Code DevContainer
- 📦 pnpm สำหรับจัดการแพ็คเกจ
- 🔧 การตั้งค่า TypeScript
- 🧰 เครื่องมือช่วยการพัฒนา (ESLint, Prettier)
- 🔄 Hot Module Replacement

## 🛠️ เทคโนโลยีที่ใช้

- **Ubuntu 24.04** - ระบบปฏิบัติการพื้นฐาน
- **Node.js 20.11.1 LTS (Iron)** - รันไทม์ JavaScript
- **pnpm** - ตัวจัดการแพ็คเกจ
- **Remix.js 2.8.0** - เฟรมเวิร์คสำหรับเว็บแอปพลิเคชัน
- **Vite** - เครื่องมือสำหรับการพัฒนา (Dev server)
- **TypeScript** - JavaScript แบบ Type-safe
- **Docker & Docker Compose** - การจัดการคอนเทนเนอร์
- **VS Code DevContainer** - การพัฒนาในสภาพแวดล้อมที่แยกออกมา

## 🚦 การเริ่มต้นใช้งาน

### 📋 ข้อกำหนดเบื้องต้น

- [Docker](https://www.docker.com/products/docker-desktop/) และ [Docker Compose](https://docs.docker.com/compose/install/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [VS Code Remote Development Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)

### 🚀 การติดตั้ง

1. โคลนโปรเจกต์นี้ไปยังเครื่องของคุณ
   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. เปิดโปรเจกต์ใน VS Code
   ```bash
   code .
   ```

3. เมื่อมีการแจ้งเตือน ให้คลิก "Reopen in Container" หรือใช้คำสั่ง VS Code (F1) และเลือก "Remote-Containers: Reopen in Container"

4. รอให้คอนเทนเนอร์สร้างและตั้งค่าสภาพแวดล้อมการพัฒนา (อาจใช้เวลาสักครู่ในครั้งแรก)

### 🏃‍♂️ การรันโปรเจกต์

เมื่อเปิดใน DevContainer แล้ว ระบบจะสร้างโปรเจกต์ Remix.js โดยอัตโนมัติหากยังไม่มีอยู่ และเริ่มต้นเซิร์ฟเวอร์สำหรับการพัฒนา

1. เข้าถึงแอปพลิเคชันได้ที่: [http://localhost:3000](http://localhost:3000)

2. คุณสามารถเริ่มต้นการพัฒนาด้วยการแก้ไขไฟล์ใน `/app/routes` โดยการเปลี่ยนแปลงจะถูกแสดงผลทันทีด้วย Hot Module Replacement

### ⚙️ คำสั่งที่มีประโยชน์

คำสั่งเหล่านี้สามารถรันได้ใน Terminal ของ VS Code ภายใน DevContainer:

```bash
# ติดตั้ง dependencies
pnpm install

# รันเซิร์ฟเวอร์สำหรับการพัฒนา
pnpm run dev

# สร้างแอปพลิเคชันสำหรับการใช้งานจริง
pnpm run build

# ตรวจสอบ TypeScript
pnpm run typecheck

# รัน Linter
pnpm run lint
```

## 📁 โครงสร้างโปรเจกต์

```
.
├── .devcontainer/             # การกำหนดค่า DevContainer
├── .vscode/                   # การกำหนดค่า VS Code
├── app/                       # โค้ดแอปพลิเคชัน Remix
│   ├── routes/                # เส้นทางและหน้า
│   ├── components/            # คอมโพเนนต์ที่ใช้ซ้ำได้
│   ├── styles/                # ไฟล์สไตล์
│   └── ...                    # ไฟล์อื่นๆ ของ Remix
├── public/                    # ไฟล์สถิตที่เข้าถึงได้จากเว็บ
├── Dockerfile                 # สำหรับสร้างอิมเมจ Docker
├── docker-compose.yml         # การกำหนดค่า Docker Compose
├── package.json               # การกำหนดค่าโปรเจกต์และ dependencies
└── README.md                  # เอกสารโปรเจกต์ (ไฟล์นี้)
```

## 🔒 ความปลอดภัย

- โปรเจกต์นี้มีการตั้งค่าให้รันทุกอย่างใน Docker Container ซึ่งแยกออกจากระบบของคุณ
- การตั้งค่าใน VS Code มุ่งเน้นที่การปฏิบัติตามมาตรฐานและการปลอดภัยของโค้ด

## 📝 ข้อควรทราบ

- DevContainer ใช้ Ubuntu 24.04 และ Node.js 20.11.1 LTS
- การพัฒนาทั้งหมดจะเกิดขึ้นภายใน Container ซึ่งแยกจากระบบของคุณ
- เราใช้ pnpm เป็นตัวจัดการแพ็คเกจเพื่อประสิทธิภาพและความเร็วที่ดีกว่า

## 🤝 การมีส่วนร่วม

ยินดีรับ Pull Requests! สำหรับการเปลี่ยนแปลงที่สำคัญ โปรดเปิด Issue ก่อนเพื่อหารือเกี่ยวกับสิ่งที่คุณต้องการเปลี่ยนแปลง

## 📄 ลิขสิทธิ์

[MIT](LICENSE)