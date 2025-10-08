# Public Bastion Host Security Group Outputs
output "bastion_sg_id" {
  description = "The ID of the security group"
  value       = module.public_bastion_sg.security_group_id
}

output "public_bastion_sg_group_vpc_id" {
  description = "The VPC ID"
  value       = module.public_bastion_sg.security_group_vpc_id
}

output "public_bastion_sg_group_owner_id" {
  description = "The owner ID"
  value       = module.public_bastion_sg.security_group_owner_id
}

output "public_bastion_sg_group_name" {
  description = "The name of the security group"
  value       = module.public_bastion_sg.security_group_name
}

output "public_bastion_sg_group_description" {
  description = "The description of the security group"
  value       = module.public_bastion_sg.security_group_description
}

# Private EC2 Instances Security Group Outputs
output "private_sg_id" {
  description = "The ID of the security group"
  value       = module.private_sg.security_group_id
}
output "private_sg_group_vpc_id" {
  description = "The VPC ID"
  value       = module.private_sg.security_group_vpc_id
}
output "private_sg_group_name" {
  description = "The name of the security group"
  value       = module.private_sg.security_group_name
}
