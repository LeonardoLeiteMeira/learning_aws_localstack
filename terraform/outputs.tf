// Mapa de nomes das lambdas criadas por modulo.
output "lambda_names" {
  value = { for name, mod in module.lambdas : name => mod.lambda_name }
}

// Mapa de ARNs das lambdas criadas por modulo.
output "lambda_arns" {
  value = { for name, mod in module.lambdas : name => mod.lambda_arn }
}
