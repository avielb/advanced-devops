import json

def lambda_handler(event, context):
    # TODO implement
    print("moshe")
    print(event)
    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda!'),
        'event': event
    }
