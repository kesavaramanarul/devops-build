#!/bin/bash
set -e

IMAGE_NAME="devops-build"
IMAGE_TAG="latest"

echo "🔨 Building Docker image..."
docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .

echo "✅ Build completed"
docker images | grep ${IMAGE_NAME}
# build script
