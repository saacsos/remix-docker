# 🚀 Remix.js with Docker Development Environment

โครงการนี้เป็นแม่แบบสำหรับการพัฒนา Remix.js ด้วย Docker ที่มีการตั้งค่าพร้อมสำหรับการพัฒนา

## 📋 คุณสมบัติ

- ⚡ Remix.js with Indie Stack
- 🐳 Docker และ Docker Compose
- 📦 pnpm สำหรับจัดการแพ็คเกจ
- 🔧 การตั้งค่า TypeScript
- 🛢️ Prisma ORM
- 🧰 เครื่องมือช่วยการพัฒนา (ESLint, Prettier)
- 🔄 Hot Module Replacement

## 🛠️ เทคโนโลยีที่ใช้

- **Ubuntu 24.04** - ระบบปฏิบัติการพื้นฐาน
- **Node.js 20.11.1 LTS (Iron)** - รันไทม์ JavaScript
- **pnpm** - ตัวจัดการแพ็คเกจ
- **Remix.js** - เฟรมเวิร์คสำหรับเว็บแอปพลิเคชัน
- **TypeScript** - JavaScript แบบ Type-safe
- **Prisma** - ORM สำหรับการจัดการฐานข้อมูล
- **Docker & Docker Compose** - การจัดการคอนเทนเนอร์

## 🚦 การเริ่มต้นใช้งาน

### 📋 ข้อกำหนดเบื้องต้น

- [Docker](https://www.docker.com/products/docker-desktop/) และ [Docker Compose](https://docs.docker.com/compose/install/)

### 🚀 การติดตั้ง

1. โคลนโปรเจกต์นี้ไปยังเครื่องของคุณ
   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. สร้างโปรเจกต์ Remix ใหม่ด้วยสคริปต์อัตโนมัติ
   ```bash
   ./create-remix-project.sh
   ```

3. เริ่มต้นการทำงานของคอนเทนเนอร์
   ```bash
   docker-compose up
   ```

4. เข้าถึงแอปพลิเคชันได้ที่: [http://localhost:3000](http://localhost:3000)

### 🏃‍♂️ การรันโปรเจกต์

เมื่อรันคำสั่ง `docker-compose up` แล้ว ระบบจะเริ่มต้นคอนเทนเนอร์และเซิร์ฟเวอร์สำหรับการพัฒนา

1. เข้าถึงแอปพลิเคชันได้ที่: [http://localhost:3000](http://localhost:3000)

2. คุณสามารถเริ่มต้นการพัฒนาด้วยการแก้ไขไฟล์ใน `remix-app/app/` โดยการเปลี่ยนแปลงจะถูกแสดงผลทันทีด้วย Hot Module Replacement

### ⚙️ คำสั่งที่มีประโยชน์

คำสั่งเหล่านี้สามารถรันได้ใน Terminal ภายในคอนเทนเนอร์ Docker:

```bash
# เข้าสู่คอนเทนเนอร์
docker exec -it remix-dev bash

# ติดตั้ง dependencies
pnpm install

# สร้าง Prisma client
npx prisma generate

# รันเซิร์ฟเวอร์สำหรับการพัฒนา
npx remix dev

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
├── Dockerfile                 # สำหรับสร้างอิมเมจ Docker
├── docker-compose.yaml        # การกำหนดค่า Docker Compose
├── create-remix-project.sh    # สคริปต์สร้างโปรเจกต์ Remix
├── remix-app/                 # โปรเจกต์ Remix (สร้างโดยสคริปต์)
│   ├── app/                   # โค้ดแอปพลิเคชัน Remix
│   │   ├── routes/            # เส้นทางและหน้า
│   │   ├── models/            # โมเดลข้อมูล
│   │   ├── styles/            # ไฟล์สไตล์
│   │   └── ...                # ไฟล์อื่นๆ ของ Remix
│   ├── prisma/                # การกำหนดค่า Prisma ORM
│   ├── public/                # ไฟล์สถิตที่เข้าถึงได้จากเว็บ
│   └── package.json           # การกำหนดค่าโปรเจกต์และ dependencies
└── README.md                  # เอกสารโปรเจกต์ (ไฟล์นี้)
```

## 🔒 ความปลอดภัย

- โปรเจกต์นี้มีการตั้งค่าให้รันทุกอย่างใน Docker Container ซึ่งแยกออกจากระบบของคุณ
- Remix Indie Stack มีการจัดการการรับรองตัวตนและการอนุญาตเบื้องต้น

## 📝 ข้อควรทราบ

- เราใช้ Remix Indie Stack เป็นเทมเพลตเริ่มต้น ซึ่งมี SQLite เป็นฐานข้อมูล
- Docker Container ใช้ Ubuntu 24.04 และ Node.js 20.11.1 LTS
- เราใช้ pnpm เป็นตัวจัดการแพ็คเกจเพื่อประสิทธิภาพและความเร็วที่ดีกว่า
- การเปลี่ยนแปลงในโค้ดจะทำให้เซิร์ฟเวอร์ Remix รีโหลดอัตโนมัติ

## 🤝 การมีส่วนร่วม

ยินดีรับ Pull Requests! สำหรับการเปลี่ยนแปลงที่สำคัญ โปรดเปิด Issue ก่อนเพื่อหารือเกี่ยวกับสิ่งที่คุณต้องการเปลี่ยนแปลง

## 📄 ลิขสิทธิ์

[MIT](LICENSE)