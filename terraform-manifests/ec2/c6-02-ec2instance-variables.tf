# EC2 Instance Variables
# AWS EC2 Instance Type
variable "instance_type"{
    description ="EC2 Instance type"
    type = string
    default = "t3.micro"
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