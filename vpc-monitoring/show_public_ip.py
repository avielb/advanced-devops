import json
import urllib.request
import socket

def get_public_ip():
    try:
        with urllib.request.urlopen('https://api.ipify.org') as response:
            ip = response.read().decode()
            print(f"Public IP Address: {ip}")
    except Exception as e:
        print(f"Error fetching public IP: {e}")


def lambda_handler(event, context):
    get_public_ip()
    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda!')
    }
