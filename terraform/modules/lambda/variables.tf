// Nome da lambda.
variable "name" {
  type = string
}

// Runtime da lambda (ex: python3.12).
variable "runtime" {
  type = string
}

// Handler no formato arquivo.funcao.
variable "handler" {
  type = string
}

// Caminho para o zip do codigo.
variable "filename" {
  type = string
}

// Variaveis de ambiente da lambda.
variable "environment" {
  type    = map(string)
  default = {}
}
