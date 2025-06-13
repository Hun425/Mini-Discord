# Mini-Discord
쿠버네티스 실습을 위한 미니 디스코드 프로젝트

## 배포 방법
Docker Compose를 이용해 이미지를 빌드한 뒤 레지스트리에 푸시하고 쿠버네티스에 적용합니다.

```bash
docker compose -f docker-compose.yml build
docker tag mini-discord-chat:dev username/mini-discord-chat:latest
docker push username/mini-discord-chat:latest
kubectl apply -f k8s/
```

## 부하 테스트 스크립트
WebSocket 연결 부하 테스트용 `scripts/load-test.sh` 파일을 제공합니다. 사용 전 실행 권한을 부여하세요.

```bash
chmod +x scripts/load-test.sh
```
`REDIS_HOST`와 `PORT` 환경 변수를 지정하면 접속할 서버를 변경할 수 있습니다. 예시:

```bash
REDIS_HOST=example.com PORT=8080 ./scripts/load-test.sh
```

## Docker Compose 사용법
로컬 개발 시 `docker-compose.dev.yml` 파일을 사용해 애플리케이션과 Redis를 실행할 수 있습니다.
먼저 애플리케이션 빌드를 위해 다음 명령을 실행하세요. 
프로젝트에 Gradle Wrapper가 포함되어 있지 않으므로 로컬에 설치된 Gradle을 사용합니다.

```bash
gradle bootJar
```



이후 아래 명령으로 컨테이너를 실행합니다.

```bash
docker compose -f docker-compose.dev.yml up --build
```

종료 시에는 다음 명령을 실행합니다.

```bash
docker compose -f docker-compose.dev.yml down
```

## 개발 환경 실행
Docker Compose를 이용해 애플리케이션과 Redis를 함께 실행할 수 있습니다.

```bash
docker-compose up --build
```

위 명령을 실행하면 애플리케이션은 `localhost:8080`에서 동작하며 Redis는 같은 네트워크에서 `6379` 포트로 접근할 수 있습니다.

## Docker 기반 빌드/배포 흐름
`scripts/deploy.sh` 스크립트는 다음 순서로 동작합니다.

1. `gradle bootJar` 명령으로 애플리케이션 JAR을 빌드합니다.
2. Docker 이미지를 빌드해 레지스트리에 푸시합니다.
3. `k8s` 디렉터리의 매니페스트를 적용해 클러스터에 배포합니다.

터미널에서 아래 명령을 실행하면 위 과정을 한 번에 수행합니다.

```bash
./scripts/deploy.sh
```
