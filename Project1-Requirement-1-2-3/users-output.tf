output "admin1_access_key_output" {
  value = "Access Key of user= admin1 is ${aws_iam_access_key.admin1_access_key.id}"
  sensitive = true
}

output "admin1_secret_key_output" {
  value = "Secret Key of user= admin1 is ${aws_iam_access_key.admin1_access_key.secret}"
  sensitive = true
}


output "dev1_access_key_output" {
  value = "Access Key of user= dev1 is ${aws_iam_access_key.dev1_access_key.id}"
  sensitive = true
}

output "dev1_secret_key_output" {
  value = "Secret Key of user= admin1 is ${aws_iam_access_key.dev1_access_key.secret}"
  sensitive = true
}
