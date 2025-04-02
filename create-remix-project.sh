#!/bin/bash
# create-remix-project.sh

set -e  # Exit on error

# Check if remix-app folder already exists
if [ -d "remix-app" ]; then
  echo "⚠️  The remix-app/ folder already exists. Please remove it first if you want to create a new project."
  exit 1
fi

# Create remix-app folder
mkdir -p remix-app

echo "🏗️  Building Docker image..."
docker build -t remix-dev-image .

echo "🚀  Creating Remix project in remix-app/ folder..."
# Use npx directly to create the project
docker run -it --rm \
  -v "$(pwd)/remix-app:/app" \
  -w /app \
  remix-dev-image \
  bash -c "npx create-remix@latest --template remix-run/indie-stack . && pnpm install && npx prisma generate"

echo "✅  Project setup complete!"
echo "Run 'docker-compose up' to start the development server"
echo "Then visit http://localhost:3000 in your browser"