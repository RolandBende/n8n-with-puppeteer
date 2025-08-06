FROM n8nio/n8n:latest-debian

USER root

RUN sed -i 's|http://deb.debian.org/debian|http://archive.debian.org/debian|g' /etc/apt/sources.list && \
    sed -i 's|http://security.debian.org/debian-security|http://archive.debian.org/debian-security|g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        wget gnupg2 ca-certificates \
        fonts-liberation libappindicator3-1 libasound2 libatk-bridge2.0-0 \
        libatk1.0-0 libcups2 libgbm-dev libgtk-3-0 libnss3 libx11-xcb1 \
        libxcomposite1 libxdamage1 libxext6 libxfixes3 libxkbcommon-x11-0 \
        libxrandr2 xdg-utils && \
    rm -rf /var/lib/apt/lists/*

USER node

RUN npm install puppeteer n8n-nodes-puppeteer && \
    npx puppeteer browsers install chrome && \
    npm cache clean --force
