variable "vpc_name" {
type = string
default = "ISC-dev"
}

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

# variable "vpc_avalability_zones" {
#   type = list(string)
#   default = ["us-east-2a", "us-east-2b"]
# }

variable "vpc_public_subnets" {
  type = list(string)
  default = ["10.0.10.0/24", "10.0.20.0/24"]
}

variable "vpc_private_subnets" {
  type = list(string)
  default = ["10.0.100.0/24", "10.0.200.0/24"]
}

variable "vpc_enable_nat_gateway" {
  type = bool
  default = false
}

variable "vpc_single_nat_gateway" {
  type = bool
  default = false
}

variable "vpc_nable_dns_hostnames" {
  type = bool
  default = false
}

variable "vpc_enable_dns_support" {
  type = bool
  default = false
}

variable "vpc_public_dedicated_network_acl" {
  type = bool
  default = false
}

variable "vpc_public_inbound_acl_rules" {
  type= set(object({
      rule_number = number
      rule_action = string
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_block  = string 
  }))
  default = [ 
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
    } ]
}


variable "vpc_public_outbound_acl_rules" {
   type= set(object({
      rule_number = number
      rule_action = string
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_block  = string 
  }))
  default = [ 
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
    } ]
}

variable "vpc_create_igw" {
  type = bool
  default = false
}

variable "vpc_create_egress_only_igw" {
  type = bool
  default = false
}