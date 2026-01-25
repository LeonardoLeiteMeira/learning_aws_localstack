// Nome da lambda criada pelo modulo.
output "lambda_name" {
  value = aws_lambda_function.this.function_name
}

// ARN da lambda criada pelo modulo.
output "lambda_arn" {
  value = aws_lambda_function.this.arn
}
