output "app1-privateip" {
    value = "App1 host Private IP is: ${module.ec2_app1.private_ip}"
  
}


output "app1-privatedns" {
    value = "App1 host Private DNS is: ${module.ec2_app1.private_dns}"
  
}