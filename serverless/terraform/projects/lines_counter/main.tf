provider "aws" {
  region = "us-east-1"
}

module "lines_counter" {
  source        = "../../modules/lines_counter"
  hash_key      = "ID"
  hash_key_type = "S"
  table_name    = "LinesCounts"
  bucket_name   = "avielb-files-bucket"
  filename      = "lines_counter.zip"
  function_name = "LinesCounter"
  handler       = "lines_counter.lambda_handler"
  runtime       = "python3.6"
}