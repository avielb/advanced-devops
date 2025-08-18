terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.3.0"
}

provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.1"

  name = "dev-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway     = true
  single_nat_gateway     = true
  enable_dns_hostnames   = true
  enable_dns_support     = true

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}

resource "aws_default_security_group" "default" {
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "default-sg-open"
    Environment = "dev"
  }
}


#######################

in 2402-first-repo , create folder called vpc and in it copy lines 1 - 60 


########################
1. deploy lambda with the following python code
2. make it a VPC lambda on a private subnet
3. make sure it has the right IAM role policy to be a VPC lambda:
#######################
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
    
###########################################


variable "name" {
  description = "enter your name as suffix for the s3 bucket"
}
# S3 Bucket
resource "aws_s3_bucket" "example_bucket" {
  bucket = "my-example-bucket-${var.name}"
  force_destroy = true
}

# SQS Queue
resource "aws_sqs_queue" "example_queue" {
  name = "example-queue"
}

# S3 Bucket Notification to SQS
resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.example_bucket.id

  queue {
    queue_arn     = aws_sqs_queue.example_queue.arn
    events        = ["s3:ObjectCreated:*"]
  }

  depends_on = [aws_sqs_queue.example_queue]
}

# SQS Queue Policy to allow S3 to send messages
resource "aws_sqs_queue_policy" "example_policy" {
  queue_url = aws_sqs_queue.example_queue.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "Allow-S3-SendMessage",
        Effect    = "Allow",
        Principal = "*",
        Action    = "SQS:SendMessage",
        Resource  = aws_sqs_queue.example_queue.arn,
        Condition = {
          ArnEquals = {
            "aws:SourceArn" = aws_s3_bucket.example_bucket.arn
          }
        }
      }
    ]
  })
}
