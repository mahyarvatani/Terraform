output "app2-privateip" {
  value = module.ec2_app2.private_ip

}


output "app2-privatedns" {
  value = module.ec2_app2.private_dns

}

output "web2-id" {
  value = module.ec2_app2.id

}