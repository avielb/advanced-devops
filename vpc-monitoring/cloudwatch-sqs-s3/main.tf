provider "aws" {
  region = "us-east-1"
  profile = "private"
}


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
