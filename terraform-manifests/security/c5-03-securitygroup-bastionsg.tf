# AWS EC2 Security Group Terraform Module
# Security Group for Public Bastion Host
module "public_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.3.0"

  name = "public_bastion_sg"
  description = "Security group allowing SSH from trusted IPs to bastion host"
  vpc_id = var.vpc_id
  # Ingress Rules and CIDR Block
  ingress_cidr_blocks =  ["196.200.45.250/32"]
  ingress_rules = ["ssh-tcp"]

  # Egress Rule -all-all open
  egress_rules = ["all-all"]
  tags = var.tags
}