# Terraform Block
terraform {
    required_version = "~> 1.13.3"
    required_providers {
      aws = {
        version = "~> 6.15.0"
        source = "hashicorp/terraform-provider-aws"
    }
}
}

# Provider Block
provider "aws" {
    profile = "default"
    region = "us-east-1" 
}