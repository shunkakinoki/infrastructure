resource "aws_route53_zone" "shunkakinoki_com" {
  name = "shunkakinoki.com"
}

resource "aws_route53_record" "shunkakinoki_com" {
  zone_id = aws_route53_zone.shunkakinoki_com.zone_id
  name    = aws_route53_zone.shunkakinoki_com.name
  type    = "NS"
  records = [
    aws_route53_zone.shunkakinoki_com.name_servers.0,
    aws_route53_zone.shunkakinoki_com.name_servers.1,
    aws_route53_zone.shunkakinoki_com.name_servers.2,
    aws_route53_zone.shunkakinoki_com.name_servers.3,
  ]
  ttl = "300"
}

resource "aws_route53_record" "shunkakinoki_com_A" {
  zone_id = aws_route53_zone.shunkakinoki_com.zone_id
  name    = aws_route53_zone.shunkakinoki_com.name
  type    = "A"
  records = ["76.76.21.21"]
  ttl     = "300"
}

resource "aws_route53_record" "www_shunkakinoki_com_CNAME" {
  zone_id = aws_route53_zone.shunkakinoki_com.zone_id
  name    = "www.${aws_route53_zone.shunkakinoki_com.name}"
  type    = "CNAME"
  records = ["cname.vercel-dns.com"]
  ttl     = "300"
}

resource "aws_route53_record" "shunkakinoki_com_TXT" {
  zone_id = aws_route53_zone.shunkakinoki_com.zone_id
  name    = aws_route53_zone.shunkakinoki_com.name
  type    = "TXT"
  records = ["keybase-site-verification=o1E1Em_NqWB-miaYh0dAkPwdjYPU2AZj2XYw_2fqkAU"]
  ttl     = "300"
}

resource "aws_route53_record" "app_shunkakinoki_com_CNAME" {
  zone_id = aws_route53_zone.shunkakinoki_com.zone_id
  name    = "app.${aws_route53_zone.shunkakinoki_com.name}"
  type    = "CNAME"
  records = ["cname.vercel-dns.com"]
  ttl     = "300"
}

resource "aws_route53_record" "blog_shunkakinoki_com_CNAME" {
  zone_id = aws_route53_zone.shunkakinoki_com.zone_id
  name    = "blog.${aws_route53_zone.shunkakinoki_com.name}"
  type    = "CNAME"
  records = ["cname.vercel-dns.com"]
  ttl     = "300"
}

resource "aws_route53_record" "cal_shunkakinoki_com_CNAME" {
  zone_id = aws_route53_zone.shunkakinoki_com.zone_id
  name    = "cal.${aws_route53_zone.shunkakinoki_com.name}"
  type    = "CNAME"
  records = ["cname.cal.com"]
  ttl     = "300"
}

resource "aws_route53_record" "clock_shunkakinoki_com_CNAME" {
  zone_id = aws_route53_zone.shunkakinoki_com.zone_id
  name    = "clock.${aws_route53_zone.shunkakinoki_com.name}"
  type    = "CNAME"
  records = ["cname.vercel-dns.com"]
  ttl     = "300"
}

resource "aws_route53_record" "docs_shunkakinoki_com_CNAME" {
  zone_id = aws_route53_zone.shunkakinoki_com.zone_id
  name    = "docs.${aws_route53_zone.shunkakinoki_com.name}"
  type    = "CNAME"
  records = ["cname.vercel-dns.com"]
  ttl     = "300"
}

resource "aws_route53_record" "fly_shunkakinoki_com_CNAME" {
  zone_id = aws_route53_zone.shunkakinoki_com.zone_id
  name    = "fly.${aws_route53_zone.shunkakinoki_com.name}"
  type    = "A"
  records = ["213.188.221.242"]
  ttl     = "300"
}

resource "aws_route53_record" "storybook_shunkakinoki_com_CNAME" {
  zone_id = aws_route53_zone.shunkakinoki_com.zone_id
  name    = "storybook.${aws_route53_zone.shunkakinoki_com.name}"
  type    = "CNAME"
  records = ["cname.vercel-dns.com"]
  ttl     = "300"
}

resource "aws_route53_record" "v_shunkakinoki_com_CNAME" {
  zone_id = aws_route53_zone.shunkakinoki_com.zone_id
  name    = "v.${aws_route53_zone.shunkakinoki_com.name}"
  type    = "CNAME"
  records = ["cname.vercel-dns.com"]
  ttl     = "300"
}

resource "aws_route53_record" "vercel_shunkakinoki_com_CNAME" {
  zone_id = aws_route53_zone.shunkakinoki_com.zone_id
  name    = "vercel.${aws_route53_zone.shunkakinoki_com.name}"
  type    = "CNAME"
  records = ["cname.vercel-dns.com"]
  ttl     = "300"
}

resource "aws_route53_record" "vote_shunkakinoki_com_CNAME" {
  zone_id = aws_route53_zone.shunkakinoki_com.zone_id
  name    = "vote.${aws_route53_zone.shunkakinoki_com.name}"
  type    = "CNAME"
  records = ["snapshotpage.b-cdn.net"]
  ttl     = "300"
}

resource "aws_route53_record" "yusuketanaka_birthday_2021_shunkakinoki_com_CNAME" {
  zone_id = aws_route53_zone.shunkakinoki_com.zone_id
  name    = "yusuketanaka.birthday.2021.${aws_route53_zone.shunkakinoki_com.name}"
  type    = "CNAME"
  records = ["shunkakinoki.github.io"]
  ttl     = "300"
}

resource "aws_route53_record" "newsletter_shunkakinoki_com_CNAME" {
  zone_id = aws_route53_zone.shunkakinoki_com.zone_id
  name    = "newsletter.${aws_route53_zone.shunkakinoki_com.name}"
  type    = "CNAME"
  records = ["www.getrevue.co"]
  ttl     = "300"
}

resource "aws_route53_record" "acme_challenge_shunkakinoki_com_CNAME" {
  zone_id = aws_route53_zone.shunkakinoki_com.zone_id
  name    = "_acme-challenge.fly.${aws_route53_zone.shunkakinoki_com.name}"
  type    = "CNAME"
  records = ["fly.shunkakinoki.com.6y16o.flydns.net"]
  ttl     = "300"
}

resource "aws_route53_record" "mx__domainkey_newsletter_shunkakinoki_com_TXT" {
  zone_id = aws_route53_zone.shunkakinoki_com.zone_id
  name    = "mx._domainkey.newsletter.${aws_route53_zone.shunkakinoki_com.name}"
  type    = "TXT"
  records = ["k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCu+a07Jb7uXs/ekmrFZUH71gPQMHe3EbW+zYI+QKAWh7bK5B0uTUJ5PxFJ9nurNPZ7FdJboaF/WQmJEwzLATfcYHXJr1o/xh9NQH3jf62B6CRWAB6oxKdAflZwn6rv8xBLxuL2NKQmDMfOY6zbNG68wI4s7T+ocNMoKYArePgvBwIDAQAB"]
  ttl     = "300"
}

resource "aws_route53_record" "_ens_shunkakinoki_com_TXT" {
  zone_id = aws_route53_zone.shunkakinoki_com.zone_id
  name    = "_ens.${aws_route53_zone.shunkakinoki_com.name}"
  type    = "TXT"
  records = ["a=0x4fd9D0eE6D6564E80A9Ee00c0163fC952d0A45Ed"]
  ttl     = "300"
}

resource "aws_acm_certificate" "shunkakinoki_com" {
  domain_name               = "shunkakinoki.com"
  subject_alternative_names = ["*.shunkakinoki.com"]
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "acl_shunkakinoki_com" {
  for_each = {
    for dvo in aws_acm_certificate.shunkakinoki_com.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = aws_route53_zone.shunkakinoki_com.zone_id
}
