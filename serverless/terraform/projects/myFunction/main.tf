provider "aws" {
  region     = "us-east-1"
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
