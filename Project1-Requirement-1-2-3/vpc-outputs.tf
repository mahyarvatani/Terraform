
output "vpc_id" {
  value = "VPC id is: ${module.vpc.vpc_id}"
}

output "vpc_cidr_block" {
  value = "VPC cidr Block is: ${module.vpc.vpc_cidr_block}"
}

output "public_subnets" {
  value = "Public Subnets are: ${(module.vpc.public_subnets[0])}, ${(module.vpc.public_subnets[1])}"
}

output "private_subnets" {
  value = "Public Subnets are: ${(module.vpc.private_subnets[0])}, ${(module.vpc.private_subnets[1])}"
}

output "igw_id" {
  value = "Internet Gateway id is: ${(module.vpc.igw_id)}"
}

output "natgw_ids" {
  value = "NAT Gateway id is: ${(module.vpc.natgw_ids[0])}"

}