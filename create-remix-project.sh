#!/bin/bash
# create-remix-project.sh

# สร้าง Docker image
docker build -t remix-dev-image .

# สร้างโปรเจกต์ Remix และติดตั้ง dependencies
docker run -it --rm \
  -v "$(pwd):/app" \
  -w /app \
  remix-dev-image \
  bash -c "pnpm create remix@latest . --template remix-run/remix/templates/vite && pnpm install"

echo "Remix project created successfully!"
