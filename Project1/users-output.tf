output "admin1_access_key_output" {
  value     = aws_iam_access_key.admin1_access_key.id
  sensitive = true
}

output "admin1_secret_key_output" {
  value     = aws_iam_access_key.admin1_access_key.secret
  sensitive = true
}


output "dev1_access_key_output" {
  value     = aws_iam_access_key.dev1_access_key.id
  sensitive = true
}

output "dev1_secret_key_output" {
  value     = aws_iam_access_key.dev1_access_key.secret
  sensitive = true
}
