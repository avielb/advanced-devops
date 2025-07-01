resource "aws_iam_role" "lambda_exec_role" {
  name = "lambda_vpc_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_vpc_exec_policy" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}

resource "aws_lambda_function" "vpc_lambda" {
  function_name    = "vpc_lambda_function"
  filename         = "${path.module}/lambda_function.zip"
  source_code_hash = filebase64sha256("${path.module}/lambda_function.zip")
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.12"
  role             = aws_iam_role.lambda_exec_role.arn

  vpc_config {
    subnet_ids         = module.vpc.public_subnets
    security_group_ids = [aws_default_security_group.default.id]
  }

  depends_on = [aws_iam_role_policy_attachment.lambda_vpc_exec_policy]
}
