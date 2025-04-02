FROM ubuntu:24.04

# ตั้งค่าไทม์โซนและภาษา
ENV TZ=Asia/Bangkok
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

# อัปเดตระบบและติดตั้งซอฟต์แวร์พื้นฐาน
RUN apt-get update && apt-get install -y \
    curl \
    git \
    build-essential \
    python3 \
    locales \
    language-pack-th \
    fonts-thai-tlwg \
    fonts-hack-ttf \
    vim \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# ตั้งค่าภาษา
RUN locale-gen en_US.UTF-8
RUN locale-gen th_TH.UTF-8

# ติดตั้ง Node.js
ENV NODE_VERSION=22.14.1
RUN curl -fsSL https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.gz | tar xz -C /usr/local --strip-components=1 \
    && node --version \
    && npm --version

# ติดตั้ง pnpm
ENV PNPM_HOME="/root/.local/share/pnpm"
ENV PATH="${PNPM_HOME}:${PATH}"
RUN npm install -g pnpm@latest \
    && pnpm --version

# ติดตั้ง Remix.js CLI และเครื่องมืออื่นๆ
RUN npm install -g @remix-run/dev vite typescript

# สร้างโฟลเดอร์สำหรับแอพพลิเคชัน
WORKDIR /app

# เปิดพอร์ตสำหรับการพัฒนา
EXPOSE 3000 5173

# ตั้งค่า default command
CMD ["bash"]