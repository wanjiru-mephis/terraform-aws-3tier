# Define local values in terraform
locals {
  owners = var.business_division
  environment = var.environment
  name = "${var.business_division}-${var.environment}"
  common_tags = {
    Owner = local.owners
    Name = local.name
    environment = local.environment
  
}
}