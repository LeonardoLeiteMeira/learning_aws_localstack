# Região usada no provider (LocalStack geralmente usa us-east-1 como padrão)
variable "region" {
  type    = string
  default = "us-east-1"
}

# Endpoint base do LocalStack (gateway)
variable "localstack_endpoint" {
  type    = string
  default = "http://localhost:4566"
}

# Nome da Lambda
variable "lambda_name" {
  type    = string
  default = "test_lambda"
}

# Runtime/handler da Lambda
variable "lambda_runtime" {
  type    = string
  default = "python3.12"
}

variable "lambda_handler" {
  type    = string
  default = "main.lambda_handler"
}

# Caminho do zip gerado no passo de build
variable "lambda_zip_path" {
  type    = string
  default = "../../lambdas/test_lambda/lambda.zip"
}

# Env vars que a Lambda vai receber (simulando configs)
# Evite colocar segredos reais aqui em texto puro.
variable "lambda_env" {
  type = map(string)
  default = {
    DB_URL          = "postgresql://user:pass@localhost:5432/mydb"
    FEATURE_FLAG_X  = "true"
  }
}