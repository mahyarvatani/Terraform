module "app_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.2.0"


  name        = "${local.name}-web-sg"
  description = "Security group for App with SSH,HTTP,HTTPS ports open within VPC"
  vpc_id      = module.vpc.vpc_id
  ingress_rules            = ["ssh-tcp", "http-80-tcp", "https-443-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules = ["all-all"]
  egress_cidr_blocks = ["0.0.0.0/0"]

}