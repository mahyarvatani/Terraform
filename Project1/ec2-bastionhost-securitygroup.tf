module "bastionhost_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.2.0"


  name                = "${local.name}-bastionhost-sg"
  description         = "Security group for Bastionhost with SSH ports open within VPC"
  vpc_id              = module.vpc.vpc_id
  ingress_rules       = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules        = ["all-all"]
  egress_cidr_blocks  = ["0.0.0.0/0"]

}