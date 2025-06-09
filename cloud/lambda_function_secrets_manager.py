import boto3
import json

def get_secret():
    client = boto3.client('secretsmanager')
    response = client.get_secret_value(SecretId='MyDatabaseSecret')
    return json.loads(response['SecretString'])

def lambda_handler(event, context):
    secret = get_secret()
    return {
        'statusCode': 200,
        'body': json.dumps(f"DB User: {secret['username']}")
    }