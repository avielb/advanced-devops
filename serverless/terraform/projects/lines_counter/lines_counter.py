import json
import boto3
import string
import random
def id_generator(size=6, chars=string.ascii_uppercase + string.digits):
    return ''.join(random.choice(chars) for _ in range(size))

def lambda_handler(event, context):
    s3 = boto3.client('s3')
    bucket_name = str(event["Records"][0]["s3"]["bucket"]["name"])
    key_name = str(event["Records"][0]["s3"]["object"]["key"])
    obj = s3.get_object(Bucket = bucket_name, Key = key_name)
    body_len = len(obj['Body'].read().decode('utf-8').split("\n"))
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('LinesCounts')
    table.put_item(Item={
        "ID": id_generator(),
        "BucketName": bucket_name,
        "Key": key_name,
        "LinesCount": body_len
    })
    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda!')
    }
