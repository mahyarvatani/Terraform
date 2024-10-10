output "web2-privateip" {
    value = "Web2 host Private IP is: ${module.ec2_web2.private_ip}"
  
}

output "web2-publicip" {
    value = "Web2 host Public IP is: ${module.ec2_web2.public_ip}"
  
}

output "web2-publicdns" {
    value = "Web2 host Public DNS is: ${module.ec2_web2.public_dns}"
  
}