#!/bin/bash
set -e

# Gradle build
./gradlew bootJar

# Docker build and push
IMAGE_NAME="username/mini-discord-chat:latest"

docker build -t "$IMAGE_NAME" .
docker push "$IMAGE_NAME"

# Apply Kubernetes manifests
kubectl apply -f k8s/redis.yaml
kubectl apply -f k8s/chat-deployment.yaml
kubectl apply -f k8s/chat-service.yaml
kubectl apply -f k8s/hpa.yaml

