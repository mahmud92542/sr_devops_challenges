#!/bin/bash

# Commands to execute
pm2 stop nextjs-app
rm -rf /home/ubuntu/devops-assessment/*
mv /home/ubuntu/devops-assessment-main/* /home/ubuntu/devops-assessment/.
cd /home/ubuntu/devops-assessment/
npm install nextjs
npm run build
pm2 start nextjs-app --name nextjs-app -- --port 3000
sudo systemctl reload nginx
