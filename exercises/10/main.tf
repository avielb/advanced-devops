provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "avielb-assets"
}

resource "aws_s3_bucket_object" "object" {
  bucket     = aws_s3_bucket.bucket.bucket
  source     = "./app.zip"
  key        = "app.zip"
  depends_on = [aws_s3_bucket.bucket]
}

resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "function" {
  function_name = "HelloWorldFunction"
  handler       = "app.handler"
  role          = aws_iam_role.iam_for_lambda.arn
  runtime       = "python3.7"
  s3_bucket     = aws_s3_bucket_object.object.bucket
  s3_key        = aws_s3_bucket_object.object.key
  depends_on    = [aws_s3_bucket_object.object, aws_iam_role.iam_for_lambda]
}