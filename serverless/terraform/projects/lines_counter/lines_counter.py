import json
import boto3

def lambda_handler(event, context):
    s3 = boto3.client('s3')
    print("Bucket: " + str(event["Records"][0]["s3"]["bucket"]["name"]) + " Key: " + str(event["Records"][0]["s3"]["object"]["key"]))
    obj = s3.get_object(Bucket = event["Records"][0]["s3"]["bucket"]["name"], Key = event["Records"][0]["s3"]["object"]["key"])
    body = obj['Body'].read().decode('utf-8')
    print(body)
    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda!')
    }
