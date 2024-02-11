#!/bin/bash

sudo chmod +x deploy-script.sh

# Stop the "nextjs" process managed by PM2
pm2 delete nextjs

# Remove all files and folders inside /home/ubuntu/devops-assessment/
rm -rf /home/ubuntu/devops-assessment/*

# Move the contents of /home/ubuntu/devops-assessment-main/ to /home/ubuntu/devops-assessment/
sudo mv /home/ubuntu/devops-assessment-main/ /home/ubuntu/devops-assessment/
sudo mv /home/ubuntu/deploy-script.sh /home/ubuntu/devops-assessment/devops-assessment-main/

# Change ownership of /home/ubuntu/devops-assessment/ to the "ubuntu" user and group
sudo chown -R ubuntu:ubuntu /home/ubuntu/devops-assessment

# Change directory to /home/ubuntu/devops-assessment/devops-assessment-main/
cd /home/ubuntu/devops-assessment/devops-assessment-main/
sudo chmod +x deploy-script.sh
npm install

npm install -g pm2

npm install nextjs

# Build the project
npm run build

# Start the "nextjs" process managed by PM2
pm2 start npm --name "nextjs" -- start -- -p 3000

# Reload NGINX
sudo systemctl reload nginx
