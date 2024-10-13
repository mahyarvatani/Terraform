
data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.13.0"

  name            = local.name
  cidr            = var.vpc_cidr
  azs             = data.aws_availability_zones.available.names
  public_subnets  = var.vpc_public_subnets
  private_subnets = var.vpc_private_subnets

  enable_nat_gateway           = var.vpc_enable_nat_gateway
  single_nat_gateway           = var.vpc_enable_nat_gateway
  enable_dns_hostnames         = var.vpc_nable_dns_hostnames
  enable_dns_support           = var.vpc_enable_dns_support
  public_dedicated_network_acl = var.vpc_public_dedicated_network_acl
  public_inbound_acl_rules     = var.vpc_public_inbound_acl_rules
  public_outbound_acl_rules    = var.vpc_public_outbound_acl_rules
  create_igw                   = var.vpc_create_igw
  create_egress_only_igw       = var.vpc_create_egress_only_igw

}