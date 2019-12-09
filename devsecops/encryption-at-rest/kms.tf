provider "aws" {
  region = "us-east-1"
}

resource "aws_kms_key" "key" {
  enable_key_rotation = true
}