import boto3

client = boto3.client('ec2', region_name='us-east-1')
response = client.describe_instances()
