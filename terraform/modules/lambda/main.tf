// Modulo lambda: cria a role IAM e a funcao Lambda.
resource "aws_iam_role" "lambda_exec_role" {
  name = "${var.name}_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = { Service = "lambda.amazonaws.com" }
    }]
  })
}

resource "aws_lambda_function" "this" {
  // Nome da lambda.
  function_name = var.name
  // Runtime e handler definidos no root.
  runtime       = var.runtime
  handler       = var.handler

  // Role minima para a lambda existir (LocalStack aceita permissivo).
  role     = aws_iam_role.lambda_exec_role.arn
  // Zip do codigo da lambda.
  filename = var.filename

  // Variaveis de ambiente.
  environment {
    variables = var.environment
  }

  // Garante que mudancas no zip disparem update.
  source_code_hash = filebase64sha256(var.filename)
}
