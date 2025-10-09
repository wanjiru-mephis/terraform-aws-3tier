# VPC Module
module "vpc_main" {
    source = "terraform-aws-modules/vpc/aws"
     
     # VPC Basic Details
     name = var.vpc_name
     cidr = var.vpc_cidr_block
     azs = var.vpc_availability_zones
     private_subnets = var.vpc_private_subnets
     public_subnets = var.vpc_public_subnets
    
    # Database subnets
     database_subnets = var.vpc_database_subnets
     create_database_subnet_group = var.vpc_create_database_subnet_group
     create_database_subnet_route_table = var.vpc_create_database_subnet_route_table
 
     # NAT Gateways - Outbound Communication
     enable_nat_gateway = var.vpc_enable_nat_gateway
     single_nat_gateway = var.vpc_single_nat_gateway
      
    # VPC DNS Parameters
     enable_dns_hostnames = true
     enable_dns_support   = true

        
     tags = var.tags

     # Additional Tags to Subnets
    public_subnet_tags = {
    Type = "Public Subnets"
  }
    private_subnet_tags = {
    Type = "Private Subnets"
  }  
    database_subnet_tags = {
    tier = "database"
    visibility = "private"
  }

  # Flow logs sent to S3 for later analyzing with Cloudwatch
    enable_flow_log           = false
    flow_log_destination_type = "s3"
    flow_log_destination_arn  = "arn:aws:s3:::my-vpc-flowlogs-bucket"



}