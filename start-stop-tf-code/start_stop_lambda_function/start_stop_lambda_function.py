import boto3

region = 'ap-southeast-1'
ec2 = boto3.client('ec2', region_name=region)
rds = boto3.client('rds', region_name=region)

# Define the instance IDs for EC2 instances
ec2_instances = ['']

# Define the RDS instance identifier
rds_instance = ''

def lambda_handler(event, context):
    if 'operations' in event:
        for operation in event['operations']:
            instance_type = operation.get('instance_type')
            if instance_type == 'ec2':
                if operation['operation'] == 'stop':
                    ec2.stop_instances(InstanceIds=ec2_instances)
                    print('Stopped EC2 instances: ' + str(ec2_instances))
                elif operation['operation'] == 'start':
                    ec2.start_instances(InstanceIds=ec2_instances)
                    print('Started EC2 instances: ' + str(ec2_instances))
                else:
                    print('Invalid operation for EC2 instances')
            elif instance_type == 'rds':
                if operation['operation'] == 'stop':
                    rds.stop_db_instance(DBInstanceIdentifier=rds_instance)
                    print('Stopped RDS instance: ' + rds_instance)
                elif operation['operation'] == 'start':
                    rds.start_db_instance(DBInstanceIdentifier=rds_instance)
                    print('Started RDS instance: ' + rds_instance)
                else:
                    print('Invalid operation for RDS instances')
            else:
                print('Invalid instance type')
    else:
        print('No operations provided')
