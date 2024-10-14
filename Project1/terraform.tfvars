# Generic
aws_region  = "us-east-2"
environment = "dev"
customer    = "isc"

# VPC
vpc_cidr = "10.0.0.0/16"
# vpc_avalability_zones= ["us-east-2a", "us-east-2b"]
vpc_public_subnets               = ["10.0.10.0/24", "10.0.20.0/24"]
vpc_private_subnets              = ["10.0.100.0/24", "10.0.200.0/24"]
vpc_enable_nat_gateway           = true
vpc_single_nat_gateway           = true
vpc_nable_dns_hostnames          = true
vpc_enable_dns_support           = true
vpc_public_dedicated_network_acl = true
vpc_public_inbound_acl_rules = [
  {
    rule_number = 10
    rule_action = "allow"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_block  = "0.0.0.0/0"
  },
  {

    rule_number = 20
    rule_action = "allow"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_block  = "0.0.0.0/0"
  },
  {
    rule_number = 30
    rule_action = "allow"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_block  = "0.0.0.0/0"
  },
  {
    # This rule is used for accessing the Amazon Linux Repository 
    rule_number = 40
    rule_action = "allow"
    from_port   = 32768
    to_port     = 65535
    protocol    = "tcp"
    cidr_block  = "0.0.0.0/0"
  }
]


vpc_public_outbound_acl_rules = [
  {
    rule_number = 100
    rule_action = "allow"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_block  = "0.0.0.0/0"
  }
]

vpc_create_igw             = true
vpc_create_egress_only_igw = true

# BastionHost
ec2_bastionhost_type = {
  "dev"  = "t2.micro"
  "test" = "t2.micro"
  "opr"  = "t2.micro"
}
ec2_bastionhost_keypair    = "mahyar-ohaio"
ec2_bastionhost_monitoring = false

# Web
ec2_web_type = {
  "dev"  = "t2.micro"
  "test" = "t2.micro"
  "opr"  = "t2.micro"
}
ec2_web_keypair    = "mahyar-ohaio"
ec2_web_monitoring = true

# App
ec2_app_type = {
  "dev"  = "t2.micro"
  "test" = "t2.micro"
  "opr"  = "t2.micro"
}
ec2_app_keypair    = "mahyar-ohaio"
ec2_app_monitoring = true


# ALB
alb_type = "application"