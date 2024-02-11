#!/bin/bash

cd /home/ubuntu/devops-assessment/devops-assessment-main/

# Add echo commands to check script execution line by line
echo "Running npm install..."
npm install
echo "npm install completed."

echo "Installing pm2 globally..."
npm install -g pm2
echo "pm2 installation completed."

echo "Installing Next.js..."
npm install nextjs
echo "Next.js installation completed."

# Build the project
echo "Building the project..."
npm run build
echo "Project build completed."

# Start the "nextjs" process managed by PM2
echo "Starting 'nextjs' process with PM2..."
pm2 start npm --name "nextjs" -- start -- -p 3000
echo "'nextjs' process started."

# Reload NGINX
echo "Reloading NGINX..."
sudo systemctl reload nginx
echo "NGINX reloaded."
