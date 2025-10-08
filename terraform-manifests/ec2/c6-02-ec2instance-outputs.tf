# -----------------------------
# Public EC2 Instances - Bastion Host
# -----------------------------
output "ec2_bastion_public_instance_ids" {
  description = "List of IDs of public EC2 instances (Bastion)"
  value       = module.ec2_public.id
}

output "ec2_bastion_public_ip" {
  description = "List of public IP addresses of public EC2 instances (Bastion)"
  value       = module.ec2_public.public_ip
}

# -----------------------------
# Private EC2 Instances
# -----------------------------
output "ec2_private_instance_ids" {
  description = "List of IDs of private EC2 instances"
  value       = [for inst in module.ec2_private : inst.id]
}

output "ec2_private_ip" {
  description = "List of private IP addresses of private EC2 instances"
  value       = [for inst in module.ec2_private : inst.private_ip]
}
