import json
import boto3
import string
import random
def id_generator(size=6, chars=string.ascii_uppercase + string.digits):
    return ''.join(random.choice(chars) for _ in range(size))

def lambda_handler(event, context):
    s3 = boto3.client('s3')
    print("Bucket: " + str(event["Records"][0]["s3"]["bucket"]["name"]) + " Key: " + str(event["Records"][0]["s3"]["object"]["key"]))
    obj = s3.get_object(Bucket = event["Records"][0]["s3"]["bucket"]["name"], Key = event["Records"][0]["s3"]["object"]["key"])
    body = len(obj['Body'].read().decode('utf-8').split("\n"))
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('LinesCounts')
    table.put_item(Item={
        "ID": id_generator(),
        "BucketName": "avielb-files-bucket",
        "Key": "aviel.txt",
        "LinesCount": 5
    })
    print(body)
    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda!')
    }
