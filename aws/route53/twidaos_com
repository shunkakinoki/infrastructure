resource "aws_route53_zone" "twidaos_com" {
  name = "twidaos.com"
}

resource "aws_route53_record" "twidaos_com" {
  allow_overwrite = true

  zone_id = aws_route53_zone.twidaos_com.zone_id
  name    = aws_route53_zone.twidaos_com.name
  type    = "NS"
  records = [
    aws_route53_zone.twidaos_com.name_servers.0,
    aws_route53_zone.twidaos_com.name_servers.1,
    aws_route53_zone.twidaos_com.name_servers.2,
    aws_route53_zone.twidaos_com.name_servers.3,
  ]
  ttl = "300"
}

resource "aws_route53_record" "twidaos_com_A" {
  zone_id = aws_route53_zone.twidaos_com.zone_id
  name    = aws_route53_zone.twidaos_com.name
  type    = "A"
  records = [
    "185.199.108.153",
    "185.199.109.153",
    "185.199.110.153",
    "185.199.111.153",
  ]
  ttl = "300"
}

resource "aws_route53_record" "twidaos_com_CNAME" {
  zone_id = aws_route53_zone.twidaos_com.zone_id
  name    = "www.${aws_route53_zone.twidaos_com.name}"
  type    = "CNAME"
  records = ["twidaos.github.io"]
  ttl     = "300"
}
