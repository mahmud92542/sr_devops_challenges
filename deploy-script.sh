#!/bin/bash

# Commands to execute
pm2 stop nextjs-app
rm -rf /home/ubuntu/devops-assessment/*
cp -R /home/ubuntu/devops-assessment/.
cd /home/ubuntu/devops-assessment/devops-assessment-main
npm install nextjs
npm run build
pm2 start nextjs-app --name nextjs-app -- --port 3000
sudo systemctl reload nginx
