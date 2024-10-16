
# resource "aws_acm_certificate" "cert" {
#   domain_name               = data.aws_route53_zone.domain.name
#   subject_alternative_names = ["*.${data.aws_route53_zone.domain.name}"]
#   validation_method         = "DNS"
# }

# resource "aws_route53_record" "certvalidation" {
#   for_each = {
#     for d in aws_acm_certificate.cert.domain_validation_options : d.domain_name => {
#       name   = d.resource_record_name
#       record = d.resource_record_value
#       type   = d.resource_record_type
#     }
#   }
#   allow_overwrite = true
#   name            = each.value.name
#   records         = [each.value.record]
#   ttl             = 60
#   type            = each.value.type
#   zone_id         = data.aws_route53_zone.domain.zone_id
# }
# resource "aws_acm_certificate_validation" "certvalidation" {
#   certificate_arn         = aws_acm_certificate.cert.arn
#   validation_record_fqdns = [for r in aws_route53_record.certvalidation : r.fqdn]
# }

# resource "aws_route53_record" "websiteurl" {
#   name    = data.aws_route53_zone.domain.name
#   zone_id = data.aws_route53_zone.domain.zone_id
#   type    = "A"
#   alias {
#     name                   = aws_cloudfront_distribution.cf_dist.domain_name
#     zone_id                = aws_cloudfront_distribution.cf_dist.hosted_zone_id
#     evaluate_target_health = true
#   }
# }


# resource "aws_cloudfront_distribution" "cf_dist" {
#   enabled             = true
#   aliases             = [data.aws_route53_zone.domain.name]
#   origin {
#     domain_name = aws_lb.alb1.dns_name
#     origin_id   = aws_lb.alb1.dns_name
#     custom_origin_config {
#       http_port              = 80
#       https_port             = 443
#       origin_protocol_policy = "http-only"
#       origin_ssl_protocols   = ["TLSv1.2"]
#     }
#   }

#   origin {
#     domain_name = aws_lb.alb2.dns_name
#     origin_id   = aws_lb.alb2.dns_name
#     custom_origin_config {
#       http_port              = 80
#       https_port             = 443
#       origin_protocol_policy = "http-only"
#       origin_ssl_protocols   = ["TLSv1.2"]
#     }
#   }
  
#   default_cache_behavior {
#     allowed_methods        = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
#     cached_methods         = ["GET", "HEAD", "OPTIONS"]
#     target_origin_id       = aws_lb.alb1.dns_name
#     viewer_protocol_policy = "redirect-to-https"
#     forwarded_values {
#       headers      = []
#       query_string = true
#       cookies {
#         forward = "all"
#       }
#     }
#   }
#   restrictions {
#     geo_restriction {
#       restriction_type = "whitelist"
#       locations        = ["IN", "US", "CA"]
#     }
#   }
#   viewer_certificate {
#     acm_certificate_arn      = aws_acm_certificate.cert.arn
#     ssl_support_method       = "sni-only"
#     minimum_protocol_version = "TLSv1.2_2018"
#   }
# }