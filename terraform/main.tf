// Root module: define o conjunto de lambdas e instancia o modulo reutilizavel.
locals {
  // Lista fixa de lambdas para uso local (sem tfvars/CLI).
  lambdas = {
    test_lambda = {
      runtime  = "python3.12"
      handler  = "main.lambda_handler"
      zip_path = abspath("${path.root}/../lambdas/test_lambda/lambda.zip")
      env = {
        DB_URL         = "postgresql://user:pass@localhost:5432/mydb"
        FEATURE_FLAG_X = "true"
      }
    }

    second_lambda = {
      runtime  = "python3.12"
      handler  = "main.lambda_handler"
      zip_path = abspath("${path.root}/../lambdas/second_lambda/lambda.zip")
      env = {
        DB_URL         = "postgresql://user:pass@localhost:5432/mydb"
        FEATURE_FLAG_X = "true"
      }
    }
  }
}

// Instancia uma lambda por item do mapa local.lambdas.
module "lambdas" {
  source = "./modules/lambda"

  for_each = local.lambdas

  // Cada chave do mapa vira o nome da lambda.
  name        = each.key
  runtime     = each.value.runtime
  handler     = each.value.handler
  // Garante caminho absoluto para o zip, independente do diretorio atual.
  filename    = abspath(each.value.zip_path)
  // Variaveis de ambiente da lambda.
  environment = each.value.env
}
