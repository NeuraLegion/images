#!/bin/sh

(ulimit -n 65000 || true) && (ulimit -p 65000 || true) && nohup /usr/bin/chromium-browser \
  --remote-debugging-address=0.0.0.0 --remote-debugging-port=9222 --disable-gpu --no-sandbox\
  "$@" &
