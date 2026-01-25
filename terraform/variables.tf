// Regiao AWS usada pelo provider (LocalStack geralmente usa us-east-1).
variable "region" {
  type    = string
  default = "us-east-1"
}

// Endpoint do LocalStack para os servicos AWS simulados.
variable "localstack_endpoint" {
  type    = string
  default = "http://localhost:4566"
}
