**This repository holds two key components:**

**1. devops-assessment-main** </br>
**2. start-stop-tf-code**

✨ <h2> Start & Stop EC2 & RDS via Lambda on schedule </h2> ✨

For in-depth information, please refer to the dedicated [README](start-stop-tf-code) within this folder.

✨ <h2> DevOps Assesment NextJs application </h2> ✨

For comprehensive details, please refer to the dedicated [README](devops-assessment-main) within this folder.


# CI/CD Pipeline with CodePipeline and CodeDeploy for Automatic Deployment on EC2

![Screenshot 2024-02-12 at 11 23 42 AM](https://github.com/mahmud92542/sr_devops_challenges/assets/34007876/1cd25344-6d6c-4b40-b9db-b434e2a1b358)


This repository contains configurations and scripts to set up a Continuous Integration and Continuous Deployment (CI/CD) pipeline using AWS services like CodePipeline and CodeDeploy. The pipeline automatically deploys changes to an application hosted on EC2 instances whenever a developer pushes code changes to specific branches on GitHub.

## Features

- Automatically triggers deployment upon code push to GitHub.
- Manual approval step before deployment to ensure control over production releases.
- Notifications for various pipeline events (success, failure, cancellation, etc.).
- Separate pipelines for different branches (dev, uat, prod) for better control and isolation.

## Components

### 1. CodePipeline

CodePipeline orchestrates the steps of the CI/CD process. It listens for changes in the connected GitHub repositories, retrieves the latest code, and manages the deployment process.

### 2. CodeDeploy

CodeDeploy automates the deployment of the application to EC2 instances. It ensures that deployments are done reliably and with minimal downtime.

### 3. IAM Role

An IAM role is configured to provide necessary permissions to CodeDeploy for accessing AWS resources securely.

### 4. appspec.yml

The `appspec.yml` file contains instructions for CodeDeploy on how to deploy the application. It specifies pre-deployment and post-deployment hooks and other deployment-related configurations.

### 5. app.sh

The `app.sh` script, located inside the `devops-assessment` folder, is responsible for starting the new version of the application after deployment. This script contains the necessary setup or configuration steps required by the application.

## Usage

1. **Setup IAM Role**: Create an IAM role with necessary permissions for CodePipeline and CodeDeploy to access AWS resources.

2. **Configure CodePipeline**: Set up CodePipeline to listen to the GitHub repository and configure the pipeline stages, including source, build, and deploy stages.

3. **Define Approval Step**: Configure a manual approval step in the pipeline to ensure control over production deployments. This step allows an administrator to review changes before deployment.

4. **Define Notifications**: Configure notifications in CodePipeline to receive alerts for various pipeline events, such as success, failure, or manual approval.

5. **Branch Specific Pipelines**: Set up separate pipelines for different branches (e.g., dev, uat, prod) to isolate changes and control deployments to different environments.

6. **Customize Deployment Scripts**: Modify the `appspec.yml` and `app.sh` files as per the requirements of the application being deployed.

7. **Testing**: Test the CI/CD pipeline by pushing changes to the configured GitHub branches and verifying that deployments occur as expected.
