#!/bin/sh

RENDER_URL="${RENDER_SERVICE_URL:-https://your-render-service.onrender.com}"
PING_INTERVAL="${PING_INTERVAL:-300}"

echo "[KeepAlive] Starting ping service to $RENDER_URL every ${PING_INTERVAL} seconds"

while true; do
    sleep $PING_INTERVAL
    echo "[KeepAlive] Pinging $RENDER_URL at $(date)"
    curl -s -o /dev/null -w "Status: %{http_code}\n" "$RENDER_URL/health" || curl -s -o /dev/null -w "Status: %{http_code}\n" "$RENDER_URL/"
    echo "[KeepAlive] Ping completed at $(date)"
done
