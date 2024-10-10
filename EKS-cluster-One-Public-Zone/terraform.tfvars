# Generic
aws_region  = "us-east-2"
environment = "dev"
customer    = "ISC"

# VPC
vpc_cidr                         = "10.0.0.0/16"
vpc_public_subnets               = ["10.0.10.0/24", "10.0.20.0/24"]
vpc_nable_dns_hostnames          = true
vpc_enable_dns_support           = true
vpc_public_dedicated_network_acl = true

vpc_public_inbound_acl_rules = [
  {
    rule_number = 100
    rule_action = "allow"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_block  = "0.0.0.0/0"
}, ]

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

# EKS
cluster_version                     = 1.31
cluster_ipv4_cidr                   = "172.20.0.0/16"
cluster_endpoint_public_access      = true
cluster_endpoint_public_access_cidr = ["0.0.0.0/0"]
