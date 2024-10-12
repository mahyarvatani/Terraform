output "web1-privateip" {
    value = "Web1 host Private IP is: ${module.ec2_web1.private_ip}"
  
}

output "web1-publicip" {
    value = "Web1 host Public IP is: ${module.ec2_web1.public_ip}"
  
}

output "web1-publicdns" {
    value = "Web1 host Public DNS is: ${module.ec2_web1.public_dns}"
  
}

output "web1-id" {
    value = "Web1 host ID is: ${module.ec2_web1.id}"
  
}