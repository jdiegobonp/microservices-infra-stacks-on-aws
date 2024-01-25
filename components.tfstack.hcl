provider "aws" "configurations" {
    for_each = var.regions
    config {
        region = each.value
    }
}


component "vpc" {
  for_each = var.regions

  source = "./modules/vpc"

  inputs = {
    name = var.name
    cidr_block = var.cidr_block
  }

  providers = {
    aws     = provider.aws.configurations[each.value]
  }
}

component "ecs" {
  for_each = var.regions

  source = "./modules/ecs"

  inputs = {
    name = var.name
  }

  providers = {
    aws     = provider.aws.configurations[each.value]
  }
}