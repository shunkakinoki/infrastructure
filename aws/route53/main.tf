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
  records = ["76.76.21.21"]
  ttl     = "300"
}

resource "aws_route53_record" "shunkakinoki_com_MX_A" {
  zone_id = aws_route53_zone.shunkakinoki.zone_id
  name    = aws_route53_zone.shunkakinoki.name
  type    = "MX"
  records = ["mxa.mailgun.org"]
  ttl     = "300"
}

resource "aws_route53_record" "shunkakinoki_com_MX_B" {
  zone_id = aws_route53_zone.shunkakinoki.zone_id
  name    = aws_route53_zone.shunkakinoki.name
  type    = "MX"
  records = ["mxb.mailgun.org"]
  ttl     = "300"
}

resource "aws_route53_record" "shunkakinoki_com_TXT_mailgun" {
  zone_id = aws_route53_zone.shunkakinoki.zone_id
  name    = aws_route53_zone.shunkakinoki.name
  type    = "TXT"
  records = ["v=spf1 include:mailgun.org ~all"]
  ttl     = "300"
}

resource "aws_route53_record" "shunkakinoki_com_TXT_keybase" {
  zone_id = aws_route53_zone.shunkakinoki.zone_id
  name    = aws_route53_zone.shunkakinoki.name
  type    = "TXT"
  records = ["keybase-site-verification=o1E1Em_NqWB-miaYh0dAkPwdjYPU2AZj2XYw_2fqkAU"]
  ttl     = "300"
}

resource "aws_route53_record" "pic__domainkey_shunkakinoki_com_TXT" {
  zone_id = aws_route53_zone.shunkakinoki.zone_id
  name    = "pic._domainkey.${aws_route53_zone.shunkakinoki.name}"
  type    = "TXT"
  records = ["k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC9dcj1hl4V2kmkZ/bSWM9kO38X1DuI8/K5yvHRNpyPbmnU3UKMSepa3aTW6QrJzj4/7aDZDPTS6QlSCEMj+tILL+8PyQCabYkhPHCQzNOiQOozkOm4opK/OoMRib+OMWUNJ/5/PPTCjicZYVCmmeqoTMOhmxceR2yltQGOmSHAQwIDAQAB"]
  ttl     = "300"
}

resource "aws_route53_record" "email_shunkakinoki_com_CNAME" {
  zone_id = aws_route53_zone.shunkakinoki.zone_id
  name    = "email.${aws_route53_zone.shunkakinoki.name}"
  type    = "CNAME"
  records = ["mailgun.org"]
  ttl     = "300"
}

resource "aws_route53_record" "www_shunkakinoki_com_CNAME" {
  zone_id = aws_route53_zone.shunkakinoki.zone_id
  name    = "www.${aws_route53_zone.shunkakinoki.name}"
  type    = "CNAME"
  records = ["cname.vercel-dns.com"]
  ttl     = "300"
}
