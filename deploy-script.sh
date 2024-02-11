#!/bin/bash

sudo chmod +x deploy-script.sh
npm install -g pm2

npm install nextjs

# Build the project
npm run build

# Start the "nextjs" process managed by PM2
pm2 restart nextjs

# Reload NGINX
sudo systemctl reload nginx
