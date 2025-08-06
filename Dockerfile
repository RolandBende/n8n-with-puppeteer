FROM n8nio/n8n:latest

USER root

RUN apk update && \
    apk add --no-cache \
        chromium \
        nss \
        freetype \
        harfbuzz \
        ca-certificates \
        ttf-freefont \
        alsa-lib \
        libxcomposite \
        libxdamage \
        libxrandr \
        libxfixes \
        libxext \
        libx11 \
        libxkbcommon \
        libatk \
        gtk+3.0 \
        cups-libs \
        libwebp \
        libjpeg-turbo \
        libpng \
        libxrender \
        libxi \
        libdbus \
        libgdk-pixbuf \
        libdrm \
        libgbm \
        udev \
        xdg-utils \
        wget

ENV PUPPETEER_CACHE_DIR=/home/node/.cache/puppeteer

USER node

RUN npm install puppeteer && \
    npx puppeteer browsers install chrome
