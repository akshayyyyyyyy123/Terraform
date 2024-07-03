
# teraform block
terraform {
  required_version = "~> 1.8.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.56.1"
    }
  }
}

# provider
provider "aws" {
  region  = var.aws_region
}