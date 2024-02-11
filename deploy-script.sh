#!/bin/bash

# Commands to execute
pm2 stop nextjs
rm -rf /home/ubuntu/devops-assessment/*
sudo mv /home/ubuntu/devops-assessment-main/ /home/ubuntu/devops-assessment/
sudo chown -R ubuntu:ubuntu /home/ubuntu/devops-assessment
cd /home/ubuntu/devops-assessment/devops-assessment-main/
npm install nextjs
npm run build
pm2 start npm --name "nextjs" -- start -- -p 3000
sudo systemctl reload nginx
