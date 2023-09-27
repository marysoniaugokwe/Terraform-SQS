terraform {
  required_version = ">= 1.0"
}

provider "aws" {
  region     = var.region_name
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  version    = ">= 5.0"
}