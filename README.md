# Mini-Discord
쿠버네티스 실습을 위한 미니 디스코드 프로젝트


## 배포 스크립트 사용법
`scripts/deploy.sh`를 실행하기 전에 다음 명령으로 실행 권한을 부여하세요.

```bash
chmod +x scripts/deploy.sh
```

권한 부여 후 아래 명령으로 빌드와 배포를 한 번에 실행할 수 있습니다.

```bash
./scripts/deploy.sh
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

```bash
./gradlew bootJar
```

이후 아래 명령으로 컨테이너를 실행합니다.

```bash
docker compose -f docker-compose.dev.yml up --build
```

종료 시에는 다음 명령을 실행합니다.

```bash
docker compose -f docker-compose.dev.yml down
```

