# VPC Outputs

#VPC ID
output "vpc_id" {
    description = "ID of project VPC"
    value = module.vpc_main.vpc_id
}

# VPC CIDR Blocks
output "vpc_cidr_block" {
    description = "The CIDR Block of the VPC"
    value = module.vpc_main.vpc_cidr_block
  
}
output "public_subnets" {
  description = "List of public subnet IDs"
  value       = module.vpc_main.public_subnets
}

output "private_subnets" {
  description = "List of private subnet IDs"
  value       = module.vpc_main.private_subnets
}

# VPC AZs
output "azs" {
  description = "A list of availability zones spefified as argument to this module"
  value       = module.vpc_main.azs
}

# VPC NAT gateway Public IP
output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = module.vpc_main.nat_public_ips
}

# VPC Common tags
output "common_tags" {
    description = "Common tags used across modules"
    value = var.tags
}