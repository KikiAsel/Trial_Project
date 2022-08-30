resource "aws_route53_zone" "kiki_dev" {
  name = "kiki.dev.com"

  tags = {
    Environment = "dev"
  }
}

# resource "aws_route53_record" "kiki-dev-test" {
#   zone_id = aws_route53_zone.kiki_dev.id
#   name    = "kiki.dev.com"
#   type    = "NS"
#   ttl     = "30"
#   records = aws_route53_zone.kiki_dev.name_servers
# }
