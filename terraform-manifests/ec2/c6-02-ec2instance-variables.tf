# EC2 Instance Variables
# AWS EC2 Instance Type
variable "instance_type"{
    description ="EC2 Instance type"
    type = string
    default = "t3.micro"
}

variable "public_subnets" {
  description = "List of public subnets"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnets"
  type        = list(string)
}

# AWS EC2 Instance Key Pair
variable "instance_keypair"{
    description ="AWS EC2 Key pair"
    type = string
    default = "terraform-key"
}
variable "tags" {
  description = "Common tags applied to all resources in this VPC module"
  type        = map(string)
  default     = {}
}

# VPC ID
variable "vpc_id" {
  description = "VPC ID where EC2 instance will be launched"
  type        = string
}

# Public Subnet ID (for Bastion host)
variable "public_subnet_id" {
  description = "Subnet ID for Bastion Host EC2 instance"
  type        = string
}

# Bastion Security Group ID
variable "bastion_sg_id" {
  description = "Security Group ID for Bastion Host EC2 instance"
  type        = string
}

variable "private_sg_id" {
  description = "Security Group ID for Private EC2 instances"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g. dev, stage, prod)"
  type        = string
}