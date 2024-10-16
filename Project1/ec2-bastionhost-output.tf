output "bastionhost-privateip" {
  value = module.ec2_bastionhost.private_ip

}

output "bastionhost-publicip" {
  value = module.ec2_bastionhost.public_ip

}

output "bastionhost-publicdns" {
  value = module.ec2_bastionhost.public_dns

}