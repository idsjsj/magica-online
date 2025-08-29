# 베이스 이미지: Ubuntu
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# 필수 패키지 설치
RUN apt-get update && apt-get install -y \
    nodejs npm \
    novnc websockify \
    x11vnc xvfb \
    fluxbox \
    wget unzip curl git \
    && rm -rf /var/lib/apt/lists/*

# 작업 디렉토리
WORKDIR /app

# 앱 복사
COPY magica-online/ /app

# 의존성 설치
RUN cd /app && npm install

# 포트 설정
EXPOSE 8080

# 시작 스크립트 복사
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
