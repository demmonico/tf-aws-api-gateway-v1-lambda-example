[![License](https://img.shields.io/github/license/demmonico/tf-aws-api-gateway-v1-lambda-example)](LICENSE)
[![Tests](https://github.com/demmonico/tf-aws-api-gateway-v1-lambda-example/actions/workflows/tests.yml/badge.svg)](https://github.com/demmonico/tf-aws-api-gateway-v1-lambda-example/actions/workflows/tests.yml)

# Terraform example: AWS API Gateway v1 with Lambda

Bootstraps a new Terraform app: AWS API Gateway v1 with Lambda in a downstream.

## Usage

Please, don't forget to change domain name and hosting zone to the real one in `apig.tf` file.

## Development

Steps:
- run `make init` to initialize the repo and hooks (see [Initialize the repo](#initialize-the-repo) section)

### Initialize the repo

```shell
make init
```


### Run tests

It triggers git pre-commit hooks

```shell
make test
```


# Auto-generated specs

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
