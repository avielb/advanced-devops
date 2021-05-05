provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA6GSVZTR5HBD5OFWP"
  secret_key = "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"
}

module "lam_api" {
  source        = "../../modules/lambda_api_gateway"
  api_gw_desc   = "API GW for myFunction"
  api_gw_name   = "myFunctionGW"
  authorization = "NONE"
  filename      = "ex1.zip"
  function_name = "myFunction"
  runtime       = "python3.8"
  handler       = "ex1_hello.lambda_handler"
  http_method   = "ANY"
}