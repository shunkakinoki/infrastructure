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

resource "aws_route53_record" "_0xkaki_xyz_MX" {
  zone_id = aws_route53_zone._0xkaki_xyz.zone_id
  name    = aws_route53_zone._0xkaki_xyz.name
  type    = "MX"
  ttl     = 300

  records = ["1 aspmx.l.google.com.", "5 alt1.aspmx.l.google.com.", "5 alt2.aspmx.l.google.com.", "10 alt3.aspmx.l.google.com.", "10 alt4.aspmx.l.google.com."]
}

resource "aws_route53_record" "_0xkaki_xyz_SPF" {
  zone_id = aws_route53_zone._0xkaki_xyz.zone_id
  name    = aws_route53_zone._0xkaki_xyz.name
  type    = "SPF"
  ttl     = 300

  records = ["v=spf1 include:_spf.google.com ~all"]
}

resource "aws_route53_record" "_0xkaki_xyz_TXT" {
  zone_id = aws_route53_zone._0xkaki_xyz.zone_id
  name    = aws_route53_zone._0xkaki_xyz.name
  type    = "TXT"
  ttl     = 300

  records = ["v=spf1 include:_spf.google.com ~all"]
}

resource "aws_route53_record" "_0xkaki_xyz_google__domainkey_TXT" {
  zone_id = aws_route53_zone._0xkaki_xyz.zone_id
  name    = "google._domainkey.${aws_route53_zone._0xkaki_xyz.name}"
  type    = "TXT"
  ttl     = 300

  records = ["v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAopS++lxU5lkRsTdfUwp5CZFBkqtjnWyCg8o6ej42ucqDln/MEXcgK9FL+79Qs6lucyXeqR7rG6n35RkckE/NCD4+kwOqzbrv4H6fL0JMHsQDpj6VSv81G489d0idL/f//1+8OPYu2Uqaq7JBiaTDW/", "4WFrlKbTmn7PncpVdhHnLgA9zXpq9kOAbjSGwfnGIofS3yV5BG7Y21Me5N5M2Z54DqnrtEtLY1rZJmVkCAunOqc/IY7yEUyiaDR2DcqYGLy4kSkHPYvaiDgLIfM89RcLiRdq7s37bxCrL4FESr/fMzuTZwEKN6n6dLdG6Ns2oLkwlOX6x6BAI4BQU+8MtE/QIDAQAB"]
}

resource "aws_route53_record" "ffmrshf72cjk__0xkaki_xyz_CNAME" {
  zone_id = aws_route53_zone._0xkaki_xyz.zone_id
  name    = "ffmrshf72cjk.${aws_route53_zone._0xkaki_xyz.name}"
  type    = "CNAME"
  records = ["gv-7szyhyfghginwx.dv.googlehosted.com"]
  ttl     = "300"
}
