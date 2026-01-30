#!/bin/sh
# Generate config.json from environment variables
cat > /tmp/config.json <<EOF
{
  "mode": "${TUNN_MODE:-direct}",
  "ssh": {
    "host": "${SSH_HOST}",
    "port": ${SSH_PORT:-22},
    "username": "${SSH_USER}",
    "password": "${SSH_PASSWORD}"
  },
  "listener": {
    "port": ${LISTENER_PORT:-1080},
    "proxyType": "${PROXY_TYPE:-socks5}"
  },
  "httpPayload": "GET / HTTP/1.1[crlf]Host: localhost[crlf]Upgrade: websocket[crlf][crlf]",
  "connectionTimeout": ${CONN_TIMEOUT:-30}
}
EOF
# Run tunn with the generated config
exec tunn --config /tmp/config.json
