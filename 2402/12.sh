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
