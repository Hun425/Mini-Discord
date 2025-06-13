# Mini-Discord
쿠버네티스 실습을 위한 미니 디스코드 프로젝트

## 부하 테스트 스크립트
WebSocket 연결 부하 테스트용 `scripts/load-test.sh` 파일을 제공합니다. 사용 전 실행 권한을 부여하세요.

```bash
chmod +x scripts/load-test.sh
```

`REDIS_HOST`와 `PORT` 환경 변수를 지정하면 접속할 서버를 변경할 수 있습니다.
