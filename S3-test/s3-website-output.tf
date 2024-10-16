output "s3_website_id" {
  value = aws_s3_bucket.s3_bucket_1.id
}

output "s3_website_domain" {
  value = aws_s3_bucket.s3_bucket_1.bucket_domain_name
}

output "s3_website_endpoint" {
  value = aws_s3_bucket.s3_bucket_1.website_endpoint
}