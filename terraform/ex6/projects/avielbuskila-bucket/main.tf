provider "aws" {
  region = "us-east-1"
}

module "bucket" {
  source      = "../../modules/s3"
  bucket_name = "avielbuskila-bucket"
  bucket_acl  = "public-read"
}

locals {
  bucket_name = "avielbuskila-bucket"
  bucket_acl  = "public-read"
}

terraform {
  backend "s3" {
    bucket = "avielbuskila-terraform-states"
    key    = "terraform-state-1"
    region = "us-east-1"

  }
}
resource "aws_s3_bucket_object" "indexhtml" {
  bucket       = local.bucket_name
  key          = "index.html"
  acl          = local.bucket_acl
  source       = "tip_calc/index.html"
  content_type = "text/html"
  etag         = filemd5("tip_calc/index.html")
}

//
//resource "aws_s3_bucket_object" "stylecss" {
//  bucket = local.bucket_name
//  key = "style.css"
//  acl = local.bucket_acl
//  source = "tip_calc/style.css"
//  etag = filemd5("tip_calc/style.css")
//}
//
//resource "aws_s3_bucket_object" "tipcalculatorjs" {
//  bucket = local.bucket_name
//  key = "tipcalculator.js"
//  acl = local.bucket_acl
//  source = "tip_calc/tipcalculator.js"
//  etag = filemd5("tip_calc/tipcalculator.js")
//}