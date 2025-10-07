# EC2 InstanceS created in VPC Private Subnets
module "ec2_private" {
    source = "terraform-aws-modules/ec2-instance/aws"
    version = "6.15.0"
    
    depends_on = [ module.vpc ]

    name = "${var.environment}-vm"
    ami = data.aws_ami.amazon_linux_2023.id
    instance_type = var.instance_type 
    key_name = var.instance_keypair
    vpc_security_group_ids = [module.private_sg.security_group_id]
    
    instance_count = 2
    subnet_ids = module.vpc.private_subnets
    
    tags = var.tags
}