#!/bin/bash
# Xvfb (가상 디스플레이) 시작
Xvfb :0 -screen 0 1280x720x16 &

# 윈도우 매니저 실행
fluxbox &

# VNC 서버 실행
x11vnc -display :0 -nopw -listen localhost -xkb -forever &

# noVNC 실행
websockify --web=/usr/share/novnc/ 8080 localhost:5900 &

# Node.js 서버 실행
cd /app
node server.js
