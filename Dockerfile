FROM n8nio/n8n:latest-debian

USER root

RUN apt-get update && \
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
