# AWS EC2 Security Group Terraform Module
# Security Group for Private EC2 Instances
module "private_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.3.0"

  name = "private_sg"
  description = "Allow SSH from bastion and HTTP within VPC"
  vpc_id = var.vpc_id
  # Ingress Rules: Allow SSH only from Bastion SG
  ingress_with_source_security_group_id = [
    {
        from_port = 22
        to_port = 22
        protocl = "tcp"
        description = "SSH from bastion host"
        source_security_group_id = module.public_bastion_sg.security_group_id
    }
  ]

  # Allow internal HTTP traffic (app-communication)
  ingress_cidr_blocks = ["10.0.0.0/16"]
  ingress_rules = ["http-80-tcp"]

  # Egress Rule -all-all open. Outbound Traffic allowed
  egress_rules = ["all-all"]
  
  tags = var.tags
}