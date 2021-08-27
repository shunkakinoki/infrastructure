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

resource "aws_route53_record" "shunkakinoki_com_TXT" {
  zone_id = aws_route53_zone.shunkakinoki.zone_id
  name    = aws_route53_zone.shunkakinoki.name
  type    = "TXT"
  records = ["keybase-site-verification=o1E1Em_NqWB-miaYh0dAkPwdjYPU2AZj2XYw_2fqkAU"]
  ttl     = "300"
}

data "aws_s3_bucket" "shunkakinoki_com" {
  bucket = "shunkakinoki.com"
}

resource "aws_route53_record" "www_shunkakinoki_com_CNAME" {
  zone_id = aws_route53_zone.shunkakinoki.zone_id
  name    = "www.${aws_route53_zone.shunkakinoki.name}"
  type    = "CNAME"
  records = ["cname.vercel-dns.com"]
  ttl     = "300"
}

resource "aws_route53_record" "og_shunkakinoki_com_CNAME" {
  zone_id = aws_route53_zone.shunkakinoki.zone_id
  name    = "og.${aws_route53_zone.shunkakinoki.name}"
  type    = "CNAME"
  records = ["cname.vercel-dns.com"]
  ttl     = "300"
}

resource "aws_route53_record" "storybook_shunkakinoki_com_CNAME" {
  zone_id = aws_route53_zone.shunkakinoki.zone_id
  name    = "storybook.${aws_route53_zone.shunkakinoki.name}"
  type    = "CNAME"
  records = ["cname.vercel-dns.com"]
  ttl     = "300"
}

resource "aws_route53_record" "newsletter_shunkakinoki_com_TXT" {
  zone_id = aws_route53_zone.shunkakinoki.zone_id
  name    = "newsletter.${aws_route53_zone.shunkakinoki.name}"
  type    = "TXT"
  records = ["v=spf1 include:mailgun.org ~all"]
  ttl     = "300"
}

resource "aws_route53_record" "email_newsletter_shunkakinoki_com_CNAME" {
  zone_id = aws_route53_zone.shunkakinoki.zone_id
  name    = "email.newsletter.${aws_route53_zone.shunkakinoki.name}"
  type    = "CNAME"
  records = ["mailgun.org"]
  ttl     = "300"
}

resource "aws_route53_record" "mx__domainkey_newsletter_shunkakinoki_com_TXT" {
  zone_id = aws_route53_zone.shunkakinoki.zone_id
  name    = "mx._domainkey.newsletter.${aws_route53_zone.shunkakinoki.name}"
  type    = "TXT"
  records = ["k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCu+a07Jb7uXs/ekmrFZUH71gPQMHe3EbW+zYI+QKAWh7bK5B0uTUJ5PxFJ9nurNPZ7FdJboaF/WQmJEwzLATfcYHXJr1o/xh9NQH3jf62B6CRWAB6oxKdAflZwn6rv8xBLxuL2NKQmDMfOY6zbNG68wI4s7T+ocNMoKYArePgvBwIDAQAB"]
  ttl     = "300"
}

resource "aws_route53_record" "_ens_shunkakinoki_com_TXT" {
  zone_id = aws_route53_zone.shunkakinoki.zone_id
  name    = "_ens.${aws_route53_zone.shunkakinoki.name}"
  type    = "TXT"
  records = ["a=0x4fd9D0eE6D6564E80A9Ee00c0163fC952d0A45Ed"]
  ttl     = "300"
}
