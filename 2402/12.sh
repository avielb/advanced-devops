import json
import os

def lambda_handler(event, context):
    # TODO implement
    print("moshe")
    print(event)
    print(os.environ)
    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda!'),
        'event': event
    }
---------------------------------------------------------
import boto3
import os
from botocore.exceptions import ClientError

def get_secret(secret_name):
    """
    Retrieve the value of a secret from AWS Secrets Manager.
    :param secret_name: The name or ARN of the secret.
    :return: Secret value (String or Binary).
    """
    # Initialize the boto3 client for Secrets Manager
    client = boto3.client('secretsmanager')
    
    try:
        # Call Secrets Manager to retrieve the secret value
        response = client.get_secret_value(SecretId=secret_name)
        
        # Secrets Manager response contains either 'SecretString' or 'SecretBinary'
        if 'SecretString' in response:
            return response['SecretString']
        else:
            # If the secret is binary, decode it
            return response['SecretBinary']
    
    except ClientError as e:
        print(f"Error retrieving secret: {e}")
        return None

def lambda_handler(event, context):
    
    # Get the secret content
    secret_value = get_secret("credentials")
    
    if secret_value:
        print(f"Secret retrieved successfully: {secret_value}")
        # Process the secret (e.g., database password, API keys, etc.)
        return {
            'statusCode': 200,
            'body': f"Secret retrieved: {secret_value[:50]}"  # Just printing the first 50 chars for security
        }
    else:
        return {
            'statusCode': 500,
            'body': 'Failed to retrieve the secret.'
        }
--------------------------------------------
import boto3
import json

# Create a DynamoDB client
dynamodb = boto3.client('dynamodb')

def lambda_handler(event, context):
    # Scan the DynamoDB table "students"
    try:
        response = dynamodb.scan(
            TableName='students'  # Table name is 'students'
        )
        
        # Get the items from the response
        items = response.get('Items', [])
        
        # Check if there are items and print them
        if items:
            print("Items in the 'students' table:")
            for item in items:
                print(json.dumps(item, indent=4))
        else:
            print("No items found in the 'students' table.")
            
        return {
            'statusCode': 200,
            'body': json.dumps({
                'message': 'Successfully fetched items from DynamoDB.',
                'items': items
            })
        }

    except Exception as e:
        print(f"Error fetching data from DynamoDB: {str(e)}")
        return {
            'statusCode': 500,
            'body': json.dumps({
                'message': 'Error fetching data from DynamoDB',
                'error': str(e)
            })
        }

