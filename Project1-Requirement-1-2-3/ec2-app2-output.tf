output "app2-privateip" {
    value = "App2 host Private IP is: ${module.ec2_app2.private_ip}"
  
}


output "app2-privatedns" {
    value = "App2 host Private DNS is: ${module.ec2_app2.private_dns}"
  
}