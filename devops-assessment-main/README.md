# Next.js App Deployment with Terraform, PM2, and Nginx

This project automates the deployment of a Next.js application on an EC2 instance using Terraform. It includes setting up PM2 as a process manager to keep the Next.js app running, and Nginx as a reverse proxy to handle incoming HTTP requests.

## Requirements

Before getting started, ensure you have the following:

- AWS account
- Terraform installed locally
- Basic knowledge of Next.js, PM2, and Nginx

## Setup

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/your-username/your-repo.git
   cd your-repo
   ```

2. **Terraform Configuration:**
   - Update `ec2.tf` with any additional settings or resources you need.
   - Ensure that you have the necessary permissions to deploy resources on AWS.

3. **Deploy EC2 Instance:**
   ```bash
   terraform init
   terraform apply
   ```

4. **SSH into EC2 Instance:**
   After the EC2 instance is deployed, SSH into it to proceed with further setup:
   ```bash
   ssh -i path/to/your/key.pem ubuntu@your-ec2-public-ip
   ```

5. **Install Node.js, NPM, PM2, and Nginx:**
   - Update package index and install Node.js, NPM:
     ```bash
     sudo apt update
     sudo apt install nodejs npm
     ```
   - Install PM2 globally:
     ```bash
     sudo npm install -g pm2
     ```
   - Install Nginx:
     ```bash
     sudo apt install nginx
     ```

6. **Build and Run Next.js App:**
   - Navigate to your Next.js app directory and build the project:
     ```bash
     cd /path/to/your/nextjs/app
     npm run build
     ```
   - Start the Next.js app with PM2:
     ```bash
     pm2 start npm --name "your-app-name" -- start
     ```

7. **Configure Nginx Proxy Pass:**
   - Create a new Nginx server block configuration:
     ```bash
     sudo nano /etc/nginx/sites-available/your-app-name
     ```
   - Add the following configuration (replace placeholders with your actual values):
     ```nginx
     server {
         listen 80;
         server_name your-domain.com;

         location / {
             proxy_pass http://localhost:3000; # Assuming your Next.js app is running on port 3000
             proxy_http_version 1.1;
             proxy_set_header Upgrade $http_upgrade;
             proxy_set_header Connection 'upgrade';
             proxy_set_header Host $host;
             proxy_cache_bypass $http_upgrade;
         }
     }
     ```
   - Link your configuration file to the sites-enabled directory:
     ```bash
     sudo ln -s /etc/nginx/sites-available/your-app-name /etc/nginx/sites-enabled/
     ```
   - Test Nginx configuration for syntax errors:
     ```bash
     sudo nginx -t
     ```
   - If the test is successful, restart Nginx to apply changes:
     ```bash
     sudo systemctl restart nginx
     ```

8. **Check on the browser with your Server public IP**
