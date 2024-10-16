
data "aws_route53_zone" "domain" {
  name         = "testanisa.com"
  private_zone = false
}


resource "aws_route53_record" "web1_dns" {
  zone_id = data.aws_route53_zone.domain.zone_id
  name    = "www"
  type    = "CNAME"
  ttl     = 5

  weighted_routing_policy {
    weight = 30
  }

  set_identifier = "dev"
  records        = ["${aws_lb.alb1.dns_name}"] 
}

resource "aws_route53_record" "www-live" {
  zone_id = data.aws_route53_zone.domain.zone_id
  name    = "www"
  type    = "CNAME"
  ttl     = 5

  weighted_routing_policy {
    weight = 70
  }

  set_identifier = "live"
  records        = ["${aws_lb.alb2.dns_name}"]
}