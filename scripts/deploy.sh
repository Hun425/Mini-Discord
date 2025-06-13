#!/usr/bin/env bash
set -euo pipefail


# 빌드할 이미지 이름을 환경 변수로 지정할 수 있습니다.
IMAGE_NAME="${IMAGE_NAME:-username/mini-discord-chat:latest}"


# Docker Compose를 사용해 애플리케이션 이미지를 빌드합니다.
docker compose -f docker-compose.yml build

# 레지스트리에 푸시하기 위해 태그를 변경합니다.
docker tag mini-discord-chat:dev "$IMAGE_NAME"
docker push "$IMAGE_NAME"

# 쿠버네티스 매니페스트를 적용합니다.
kubectl apply -f k8s/

