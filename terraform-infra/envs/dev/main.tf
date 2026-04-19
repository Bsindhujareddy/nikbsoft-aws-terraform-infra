provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "../../modules/vpc"
  cidr   = var.vpc_cidr
  name   = var.vpc_name
}

module "igw" {
  source = "../../modules/igw"
  vpc_id = module.vpc.vpc_id
  name   = var.igw_name
}

module "subnets" {
  source         = "../../modules/subnets"
  vpc_id         = module.vpc.vpc_id
  public_cidrs   = var.public_subnet_cidrs
  private_cidrs  = var.private_subnet_cidrs
  azs            = var.availability_zones
}

module "nat" {
  source           = "../../modules/nat"
  public_subnet_id = module.subnets.public_subnet_ids[0]
  name             = var.nat_name
}

module "route_tables" {
  source           = "../../modules/route_tables"
  vpc_id           = module.vpc.vpc_id
  igw_id           = module.igw.igw_id
  nat_id           = module.nat.nat_id
  public_subnets   = module.subnets.public_subnet_ids
  private_subnets  = module.subnets.private_subnet_ids
}