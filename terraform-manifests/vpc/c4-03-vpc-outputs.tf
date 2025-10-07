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

# VPC Private Subnets
output "private_subnets" {
    description = "List of IDs of private subnets"
    value = module.vpc_main.private_subnets
  
}

# VPC Public Subnets
output "public_subnets" {
    description = "List of IDs of public subnets"
    value = module.vpc_main.vpc.public_subnets
  
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