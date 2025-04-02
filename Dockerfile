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

# ติดตั้ง Node.js - ตรวจสอบและติดตั้งตามสถาปัตยกรรมระบบ
ENV NODE_VERSION=20.11.1
RUN ARCH=$(uname -m) \
    && if [ "$ARCH" = "x86_64" ]; then \
         NODE_ARCH="x64"; \
       elif [ "$ARCH" = "aarch64" ] || [ "$ARCH" = "arm64" ]; then \
         NODE_ARCH="arm64"; \
       else \
         echo "Unsupported architecture: $ARCH" && exit 1; \
       fi \
    && curl -fsSL https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-${NODE_ARCH}.tar.gz | tar xz -C /usr/local --strip-components=1 \
    && node --version \
    && npm --version

# ติดตั้ง pnpm
ENV PNPM_HOME="/root/.local/share/pnpm"
ENV PATH="${PNPM_HOME}:${PATH}"
RUN npm install -g pnpm@latest \
    && pnpm --version

# ติดตั้ง Remix.js CLI และเครื่องมืออื่นๆ
# Note: We'll install Remix CLI locally in each project instead of globally
# This helps avoid version conflicts and missing module issues
RUN npm install -g vite typescript

# สร้างโฟลเดอร์สำหรับแอพพลิเคชัน
WORKDIR /app

# เปิดพอร์ตสำหรับการพัฒนา
EXPOSE 3000 5173

# ตั้งค่า default command
CMD ["bash"]