# AWS EC2 Instance Terraform Module
# Bastion Host - EC2 Instance that will be created in VPC Public Subnet
module "ec2_public" {
    source = "terraform-aws-modules/ec2-instance/aws"
    version = "6.15.0"

    name = "${var.environment}-BastionHost"
    ami = data.aws_ami.amazon_linux_2023.id
    instance_type = var.instance_type 
    key_name = var.instance_keypair
    subnet_id = module.vpc.public_subnets[0]
    vpc_security_group_ids = [module.public_bastion.security_group_id]
    tags = var.tags
}