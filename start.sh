#!/bin/sh
PORT="${PORT:-3000}"
sed "s/__PORT__/$PORT/" /app/config.json > /tmp/config.json
exec /app/xray run -config /tmp/config.json
