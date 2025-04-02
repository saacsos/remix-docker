FROM ubuntu:24.04

# Set timezone and language
ENV TZ=Asia/Bangkok
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

# Update system and install basic software
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

# Setup language
RUN locale-gen en_US.UTF-8
RUN locale-gen th_TH.UTF-8

# Install Node.js with architecture detection
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

# Install pnpm
ENV PNPM_HOME="/root/.local/share/pnpm"
ENV PATH="${PNPM_HOME}:${PATH}"
RUN npm install -g pnpm@latest \
    && pnpm --version

# Create application folder
WORKDIR /app

# Expose ports for development
EXPOSE 3000 5173

# Default command
CMD ["bash"]