FROM n8nio/n8n:latest

USER root

RUN apk update && apk add --no-cache \
    chromium \
    nss \
    alsa-lib \
    libx11 \
    libxcomposite \
    libxdamage \
    libxext \
    libxrandr \
    libxrender \
    libxss \
    libxtst \
    fontconfig \
    freetype \
    ca-certificates \
    glib \
    cairo \
    pango \
    gdk-pixbuf \
    gtk+3.0 \
    bash \
    curl \
    wget \
    libgcc \
    libstdc++

ENV PUPPETEER_CACHE_DIR=/home/node/.cache/puppeteer

USER node

RUN npm install puppeteer && \
    npx puppeteer browsers install chrome