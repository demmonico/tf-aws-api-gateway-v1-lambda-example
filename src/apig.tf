locals {
  apig_root_domain = "example.com"
  apig_subdomain   = local.env == "production" ? local.resource_name_prefix : "${local.resource_name_prefix}-${local.env}"
}

#-------------------------------------#
# Domain

data "aws_acm_certificate" "this" {
  domain      = "*.${local.apig_root_domain}"
  types       = ["AMAZON_ISSUED"]
  most_recent = true
}

data "aws_route53_zone" "this" {
  name = "${local.apig_root_domain}."
}

#-------------------------------------#
# API Gateway

data "aws_ec2_managed_prefix_list" "internal_ips" {
  filter {
    name   = "prefix-list-name"
    values = ["InternalIpsPrefixListName"]
  }
}

module "apig" {
  source = "git::https://github.com/demmonico/tf-modules-aws-api-gateway-v1.git?ref=1.0.0"

  api_name   = local.lambda_name
  stage_name = local.env

  paths = [{
    path            = "/search/{key}"
    integration_uri = module.lambda.lambda_invoke_arn
  }]

  create_lambda_permissions    = true
  lambda_permission_names_list = [local.lambda_name]

  create_whitelist_api_resource_policy = true
  whitelist_ip_cidrs = [
    for p in data.aws_ec2_managed_prefix_list.internal_ips.entries : p.cidr
  ]

  create_custom_domain   = true
  custom_domain          = "${local.apig_subdomain}.${local.apig_root_domain}"
  custom_domain_cert_arn = data.aws_acm_certificate.this.arn
  custom_domain_zone_id  = data.aws_route53_zone.this.zone_id
}
