resource "aws_route53_zone" "zone" {
      name = "myantyuworld.com"
}

resource "aws_route53_record" "www" {
      zone_id = aws_route53_zone.zone.zone_id
      name    = "www.myantyuworld.com"
      type    = "A"
      ttl     = "300"
      records = [aws_eip.eip.public_ip]
}