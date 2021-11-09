resource "aws_route53_zone" "_0xkaki_xyz" {
  name = "0xkaki.xyz"
}

resource "aws_route53_record" "_0xkaki_xyz" {
  allow_overwrite = true

  zone_id = aws_route53_zone._0xkaki_xyz.zone_id
  name    = aws_route53_zone._0xkaki_xyz.name
  type    = "NS"
  records = [
    aws_route53_zone._0xkaki_xyz.name_servers.0,
    aws_route53_zone._0xkaki_xyz.name_servers.1,
    aws_route53_zone._0xkaki_xyz.name_servers.2,
    aws_route53_zone._0xkaki_xyz.name_servers.3,
  ]
  ttl = "300"
}

resource "aws_route53_record" "_0xkaki_xyz_A" {
  zone_id = aws_route53_zone._0xkaki_xyz.zone_id
  name    = aws_route53_zone._0xkaki_xyz.name
  type    = "A"
  records = ["76.76.21.21"]
  ttl     = "300"
}

resource "aws_route53_record" "www__0xkaki_xyz_CNAME" {
  zone_id = aws_route53_zone._0xkaki_xyz.zone_id
  name    = "www.${aws_route53_zone._0xkaki_xyz.name}"
  type    = "CNAME"
  records = ["cname.vercel-dns.com"]
  ttl     = "300"
}
