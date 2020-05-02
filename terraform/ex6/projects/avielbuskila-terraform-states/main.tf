provider "aws" {
  region = "us-east-1"
}

module "bucket" {
  source      = "../../modules/s3"
  bucket_name = "avielbuskila-terraform-states"
  bucket_acl  = "public-read"
}