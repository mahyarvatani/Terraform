output "bastionhost-privateip" {
    value = "Bastion host Private IP is: ${module.ec2_bastionhost.private_ip}"
  
}

output "bastionhost-publicip" {
    value = "Bastion host Public IP is: ${module.ec2_bastionhost.public_ip}"
  
}

output "bastionhost-publicdns" {
    value = "Bastion host Public DNS is: ${module.ec2_bastionhost.public_dns}"
  
}