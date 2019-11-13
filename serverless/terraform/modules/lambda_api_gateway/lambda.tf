resource "aws_lambda_function" "function" {
  function_name = var.function_name
  handler       = var.handler
  role          = aws_iam_role.iam_for_lambda.arn
  runtime       = var.runtime
  filename      = var.filename
}


