#!/usr/bin/env bash
# 1분 동안 100개의 WebSocket 연결을 유지하며 1초마다 메시지를 전송합니다.

set -euo pipefail

WS_HOST="${WS_HOST:-localhost}"
PORT="${PORT:-8080}"

for i in $(seq 1 100); do
  (
    for j in $(seq 1 60); do
      echo "load test $i $j"
      sleep 1
    done
  ) | websocat "ws://$WS_HOST:$PORT/ws/chat" >/dev/null &
done

wait
