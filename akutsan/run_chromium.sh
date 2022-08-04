#!/bin/sh

if [ "$(ls -A /home/chromium/.fonts/)" ]; then
  fc-cache -f -v
fi

(ulimit -n 65000 || true) && (ulimit -p 65000 || true) && /usr/bin/chromium-browser \
  --remote-debugging-address=0.0.0.0 --remote-debugging-port=9222 --headless --disable-gpu \
  "$@"
