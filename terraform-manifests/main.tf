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

# === VPC Module ===
module "three-tier-VPC" {
  source = "./vpc"
  tags   = local.common_tags

}
# === SECURITY MODULE ===
module "security" {
  source = "./security"
  vpc_id = module.three-tier-vpc.vpc_id
  tags   = local.common_tags
}

# === EC2 MODULE ===
module "EC2" {
  source = "./ec2"
  tags = local.common_tags
}
