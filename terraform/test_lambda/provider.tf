terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  # Credenciais fake (LocalStack não valida de verdade)
  access_key = "test"
  secret_key = "test"
  region     = var.region

  # Esses "skip_*" evitam que o provider tente validar coisas na AWS real
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  # Endpoints apontando para o LocalStack
  endpoints {
    lambda = var.localstack_endpoint
    iam    = var.localstack_endpoint
    # Se no futuro você usar outros serviços, adiciona aqui (s3, dynamodb, etc.)
  }
}