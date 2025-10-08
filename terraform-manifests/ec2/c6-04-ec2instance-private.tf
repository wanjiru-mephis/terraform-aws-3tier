# EC2 InstanceS created in VPC Private Subnets
module "ec2_private" {
    source = "terraform-aws-modules/ec2-instance/aws"
    version = "6.1.1"
    
   depends_on = []
   count = length(var.private_subnets)


    name = "${var.environment}-vm"
    ami = data.aws_ami.amazon_linux_2023.id
    instance_type = var.instance_type 
    key_name = var.instance_keypair
    subnet_id = var.private_subnets[count.index]
    vpc_security_group_ids = [var.private_sg_id]
    
    
    tags = var.tags
}