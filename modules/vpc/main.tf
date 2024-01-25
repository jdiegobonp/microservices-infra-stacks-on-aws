locals {
  azs = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = {
    Blueprint  = var.name
  }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.5.1"

  name = var.name
  cidr = var.cidr_block

  azs             = local.azs
  private_subnets = [for k, v in local.azs : cidrsubnet(var.cidr_block, 4, k)]
  public_subnets  = [for k, v in local.azs : cidrsubnet(var.cidr_block, 8, k + 48)]

  enable_nat_gateway = true
  single_nat_gateway = true
  tags = local.tags
}