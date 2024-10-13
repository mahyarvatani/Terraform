output "app1-privateip" {
  value = module.ec2_app1.private_ip

}


output "app1-privatedns" {
  value = module.ec2_app1.private_dns

}