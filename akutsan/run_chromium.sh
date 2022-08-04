#!/bin/sh

ip=$(hostname --ip-address)
nohup socat tcp-listen:9222,bind="$ip",fork tcp:127.0.0.1:9222 &
(ulimit -n 65000 || true) && (ulimit -p 65000 || true) && nohup /usr/bin/chromium-browser \
  --remote-debugging-port=9222 --disable-gpu --no-sandbox\
  "$@" &
