# Input Variables
# AWS Region
variable "aws_region" {
    description = "Region to provision AWS resources"
    type = string
    default = "us-east-1"  
}

# Environment Variable
variable "environment" {
    description = "Environment variable used as aprefix"
    type = string
    default = "dev"
}

# Business Division
variable "business_division" {
    description = "Business division in the large organization in which this infrastructure belongs to"
    type = string
    default = "SAP"
}

