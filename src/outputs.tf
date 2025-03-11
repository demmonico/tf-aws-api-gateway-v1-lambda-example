# Lambda Outputs

output "module_lambda_name" {
  value = module.lambda.lambda_name
}

output "module_lambda_arn" {
  value = module.lambda.lambda_arn
}

output "module_lambda_invoke_arn" {
  value = module.lambda.lambda_invoke_arn
}

# API Gateway Outputs

output "module_apig_id" {
  value = module.apig.apig_id
}

output "module_apig_arn" {
  value = module.apig.apig_arn
}

output "module_apig_execution_arn" {
  value = module.apig.apig_execution_arn
}

output "module_apig_deployment_id" {
  value = module.apig.deployment_id
}

output "module_apig_deployment_invoke_url" {
  value = module.apig.deployment_invoke_url
}

output "module_apig_cw_log_group_name" {
  value = module.apig.cw_log_group_name
}
