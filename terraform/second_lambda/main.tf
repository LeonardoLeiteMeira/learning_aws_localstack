# Role IAM que a Lambda precisa (no LocalStack é mais "flexível",
# mas o provider ainda exige um role para criar o recurso da Lambda)
resource "aws_iam_role" "lambda_exec_role" {
  name = "${var.lambda_name}_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = { Service = "lambda.amazonaws.com" }
    }]
  })
}

# Recurso principal: Lambda Function
resource "aws_lambda_function" "this" {
  function_name = var.lambda_name
  runtime       = var.lambda_runtime
  handler       = var.lambda_handler

  role     = aws_iam_role.lambda_exec_role.arn
  filename = var.lambda_zip_path

  # Env vars para config
  environment {
    variables = var.lambda_env
  }

  # Dica: se você rebuildar o zip e o Terraform não perceber mudança,
  # use source_code_hash (precisa apontar para o arquivo zip)
  source_code_hash = filebase64sha256(var.lambda_zip_path)
}