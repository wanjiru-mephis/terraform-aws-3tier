module "three-tier-vpc" {
  source = "./vpc"
  tags   = local.common_tags
}

module "security" {
  source = "./security"
  vpc_id = module.three-tier-vpc.vpc_id
  tags   = local.common_tags
}

module "ec2" {
  source           = "./ec2"
  environment      = var.environment
  vpc_id           = module.three-tier-vpc.vpc_id
  public_subnets   = module.three-tier-vpc.public_subnets
  private_subnets  = module.three-tier-vpc.private_subnets
  public_subnet_id = module.three-tier-vpc.public_subnets[0]
  bastion_sg_id    = module.security.bastion_sg_id
  private_sg_id    = module.security.private_sg_id
  tags             = local.common_tags
}
