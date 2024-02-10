```markdown
# Automating EC2 and RDS Instance Start/Stop with EventBridge and Lambda

This repository contains Terraform code and a Python Lambda function to automate the start and stop operations of EC2 and RDS instances on AWS. The automation is triggered by EventBridge rules, which are scheduled to run every Monday to Friday at 8 AM and 8 PM respectively.

![Alt text](https://github.com/mahmud92542/sr_devops_challenges/blob/main/start-stop-tf-code/diagram.png)

## Prerequisites

Before getting started, ensure you have the following:

- An AWS account
- Terraform installed on your local machine
- AWS CLI configured with appropriate permissions

## Setup Instructions

1. Clone this repository to your local machine:

   ```bash
   git clone <repository-url>
   ```

2. Navigate to the repository directory:

   ```bash
   cd <repository-directory>
   ```

3. Update the `variables.tf` file with your desired configurations, including the AWS region, instance IDs, RDS instance identifier, etc.

4. Initialize Terraform:

   ```bash
   terraform init
   ```

5. Review the changes that Terraform will apply:

   ```bash
   terraform plan
   ```

6. Apply the changes to create the infrastructure:

   ```bash
   terraform apply
   ```

7. Once the Terraform deployment is complete, verify that the IAM role, Lambda function, custom policy, and EventBridge rule are created in your AWS account.

## Usage

The Lambda function is triggered by EventBridge rules scheduled to run every Monday to Friday at 8 AM and 8 PM respectively. When triggered, the Lambda function receives a payload specifying whether to start or stop EC2 and RDS instances.

You can manually trigger the Lambda function with the desired payload using the AWS Management Console, AWS CLI, or SDKs.

Example payload for starting EC2 and RDS instances:

```json
{
    "operations": [
        {
            "instance_type": "ec2",
            "operation": "start"
        },
        {
            "instance_type": "rds",
            "operation": "start"
        }
    ]
}
```

Example payload for stopping EC2 and RDS instances:

```json
{
    "operations": [
        {
            "instance_type": "ec2",
            "operation": "stop"
        },
        {
            "instance_type": "rds",
            "operation": "stop"
        }
    ]
}
```

## Cleanup

To remove the resources created by Terraform, run:

```bash
terraform destroy
```

Confirm the destruction when prompted.

## Additional Notes

- Ensure that the Lambda function has appropriate permissions to perform the start and stop operations on EC2 and RDS instances. Update the IAM policy attached to the Lambda function if necessary.
- Review and adjust the EventBridge rule schedule in the Terraform code (`eventbridge.tf`) as needed.
