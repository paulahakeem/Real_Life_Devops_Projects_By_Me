/* Configure the AWS Provider */
provider "aws" {
  access_key = var.access_key_id
  region = "us-east-1"
  secret_key = var.aws_secret_access_key
}

# terraform {
#   required_providers {
#     kubectl = {
#       source  = "gavinbunney/kubectl"
#       version = ">= 1.14.0"
#     }
#     helm = {
#       source  = "hashicorp/helm"
#       version = ">= 2.6.0"
#     }
#   }

#   required_version = "~> 1.0"
# }