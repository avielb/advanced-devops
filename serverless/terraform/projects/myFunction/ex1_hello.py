import json

def lambda_handler(event, context):
    rc = 200
    result = "Hello from lambda"
    if event["httpMethod"] == "GET":
        rc = 200
        result = "here is the list of cars you asked: Madza, Citroen, Volkswagen"
    elif event["httpMethod"] == "POST":
        rc = 202
        result = "Saving the car"
    return {
        'statusCode': rc,
        'body': result
    }
