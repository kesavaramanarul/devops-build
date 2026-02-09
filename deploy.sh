#!/bin/bash
set -e

IMAGE_NAME="devops-build"
IMAGE_TAG="latest"
CONTAINER_NAME="devops-nginx"
HOST_PORT=80
CONTAINER_PORT=80

echo "🛑 Stopping old container if exists..."
docker stop ${CONTAINER_NAME} 2>/dev/null || true
docker rm ${CONTAINER_NAME} 2>/dev/null || true

echo "🚀 Starting new container..."
docker run -d \
  --name ${CONTAINER_NAME} \
  -p ${HOST_PORT}:${CONTAINER_PORT} \
  --restart always \
  ${IMAGE_NAME}:${IMAGE_TAG}

echo "✅ Deployment successful"
docker ps | grep ${CONTAINER_NAME}
