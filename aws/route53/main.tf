resource "aws_route53_zone" "shunkakinoki" {
  name = "shunkakinoki.com"
}

resource "aws_route53_record" "shunkakinoki_com" {
  zone_id = aws_route53_zone.shunkakinoki.zone_id
  name    = aws_route53_zone.shunkakinoki.name
  type    = "NS"
  records = [
    aws_route53_zone.shunkakinoki.name_servers.0,
    aws_route53_zone.shunkakinoki.name_servers.1,
    aws_route53_zone.shunkakinoki.name_servers.2,
    aws_route53_zone.shunkakinoki.name_servers.3,
  ]
  ttl = "300"
}

resource "aws_route53_record" "shunkakinoki_com_A" {
  zone_id = aws_route53_zone.shunkakinoki.zone_id
  name    = aws_route53_zone.shunkakinoki.name
  type    = "A"
  alias {
    name                   = "d2u1ftrxn4zlf1.cloudfront.net"
    zone_id                = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "pitch_shunkakinoki_com_CNAME" {
  zone_id = aws_route53_zone.shunkakinoki.zone_id
  name    = "pitch.${aws_route53_zone.shunkakinoki.name}"
  type    = "CNAME"
  records = ["shunkakinoki.github.io"]
  ttl     = "300"
}

resource "aws_route53_record" "wiki_shunkakinoki_com_CNAME" {
  zone_id = aws_route53_zone.shunkakinoki.zone_id
  name    = "wiki.${aws_route53_zone.shunkakinoki.name}"
  type    = "CNAME"
  records = ["hosting.gitbook.com"]
  ttl     = "300"
}

resource "aws_route53_record" "www_shunkakinoki_com_CNAME" {
  zone_id = aws_route53_zone.shunkakinoki.zone_id
  name    = "www.${aws_route53_zone.shunkakinoki.name}"
  type    = "CNAME"
  records = ["cname.vercel-dns.com"]
  ttl     = "300"
}
