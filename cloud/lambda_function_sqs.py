import json

def lambda_handler(event, context):
    for record in event['Records']:
        body = record['body']
        print("Received message:", body)
    return {
        'statusCode': 200,
        'body': json.dumps('Processed messages.')
    }