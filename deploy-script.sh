#!/bin/bash

npm install

npm install -g pm2

npm install nextjs

# Build the project
npm run build

# Start the "nextjs" process managed by PM2
pm2 start npm --name "nextjs" -- start -- -p 3000

# Reload NGINX
sudo systemctl reload nginx
