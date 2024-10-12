module "alb_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.2.0"


  name        = "${local.name}-alb-sg"
  description = "Security group for alb with HTTP,HTTPS ports open within VPC"
  vpc_id      = module.vpc.vpc_id
  ingress_rules            = ["http-80-tcp", "https-443-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules = ["all-all"]
  egress_cidr_blocks = ["0.0.0.0/0"]

}