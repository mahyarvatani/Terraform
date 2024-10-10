
output "bastionhost_elasticip_dns" {
 value = "Bastionhost Elastic DNS name is: ${aws_eip.bastionhost_elasticip.public_dns}"
}

output "bastionhost_elasticip" {
 value = "Bastionhost Elastic IP is: ${aws_eip.bastionhost_elasticip.public_ip}"
}


output "web1_elasticip_dns" {
 value = "Web1 Elastic DNS Name is: ${aws_eip.web1_elasticip.public_dns}"
}

output "web1_elasticip" {
 value = "Web1 Elastic IP is: ${aws_eip.web1_elasticip.public_ip}"
}

output "web2_elasticip_dns" {
 value = "Web2 Elastic DNS Name is: ${aws_eip.web2_elasticip.public_dns}"
}

output "web2_elasticip" {
 value = "Web2 Elastic IP is: ${aws_eip.web2_elasticip.public_ip}"
}