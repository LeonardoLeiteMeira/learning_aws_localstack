// Configuracao de providers usados pelo root module.
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

// Provider AWS apontado para o LocalStack.
provider "aws" {
  // Credenciais dummy usadas apenas no LocalStack.
  access_key = "test"
  secret_key = "test"
  // Regiao configuravel via variavel.
  region     = var.region

  // Evita validacoes contra AWS real.
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  // Endpoints do LocalStack para os servicos usados.
  endpoints {
    lambda = var.localstack_endpoint
    iam    = var.localstack_endpoint
  }
}
