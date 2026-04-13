module "vpc" {
  source = "../../../modules/vpc"

  project     = var.project
  environment = var.environment

  vpc_cidr = var.vpc_cidr
  azs      = var.azs

  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  enable_nat_gateway   = var.enable_nat_gateway
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = var.tags
}
