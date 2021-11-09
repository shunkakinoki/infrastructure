resource "aws_route53_zone" "thisweekinweb3_com" {
  name = "thisweekinweb3.com"
}

resource "aws_route53_record" "thisweekinweb3_com" {
  zone_id = aws_route53_zone.thisweekinweb3_com.zone_id
  name    = aws_route53_zone.thisweekinweb3_com.name
  type    = "NS"
  records = [
    aws_route53_zone.thisweekinweb3_com.name_servers.0,
    aws_route53_zone.thisweekinweb3_com.name_servers.1,
    aws_route53_zone.thisweekinweb3_com.name_servers.2,
    aws_route53_zone.thisweekinweb3_com.name_servers.3,
  ]
  ttl = "300"
}

resource "aws_route53_record" "thisweekinweb3_com_A" {
  zone_id = aws_route53_zone.thisweekinweb3_com.zone_id
  name    = aws_route53_zone.thisweekinweb3_com.name
  type    = "A"
  records = ["76.76.21.21"]
  ttl     = "300"
}

resource "aws_route53_record" "www_thisweekinweb3_com_CNAME" {
  zone_id = aws_route53_zone.thisweekinweb3_com.zone_id
  name    = "www.${aws_route53_zone.thisweekinweb3_com.name}"
  type    = "CNAME"
  records = ["cname.vercel-dns.com"]
  ttl     = "300"
}
