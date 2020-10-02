resource "aws_route53_zone" "shunkakinoki" {
  name = "shunkakinoki.com"
}

resource "aws_route53_record" "shunkakinoki_com" {
  zone_id = aws_route53_zone.shunkakinoki.zone_id
  name    = aws_route53_zone.shunkakinoki.name
  type    = "NS"
  records = [
    "${aws_route53_zone.shunkakinoki.name_servers.0}",
    "${aws_route53_zone.shunkakinoki.name_servers.1}",
    "${aws_route53_zone.shunkakinoki.name_servers.2}",
    "${aws_route53_zone.shunkakinoki.name_servers.3}",
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

resource "aws_route53_record" "shunkakinoki_com_TXT" {
  zone_id = aws_route53_zone.shunkakinoki.zone_id
  name    = aws_route53_zone.shunkakinoki.name
  type    = "TXT"
  records = ["KUBESAIL_VERIFY=1c03ce53-e977-4575-a342-9b38760f3819"]
  ttl     = "300"
}

resource "aws_route53_record" "k8s_shunkakinoki_com_NS" {
  zone_id = aws_route53_zone.shunkakinoki.zone_id
  name    = "k8s.${aws_route53_zone.shunkakinoki.name}"
  type    = "NS"
  records = [
    "${aws_route53_zone.k8s_shunkakinoki.name_servers.0}",
    "${aws_route53_zone.k8s_shunkakinoki.name_servers.1}",
    "${aws_route53_zone.k8s_shunkakinoki.name_servers.2}",
    "${aws_route53_zone.k8s_shunkakinoki.name_servers.3}",
  ]
  ttl = "300"
}

resource "aws_route53_record" "blog_shunkakinoki_com_CNAME" {
  zone_id = aws_route53_zone.shunkakinoki.zone_id
  name    = "blog.${aws_route53_zone.shunkakinoki.name}"
  type    = "CNAME"
  records = ["shunkakinoki.github.io"]
  ttl     = "300"
}

resource "aws_route53_record" "infrastructure_shunkakinoki_com_CNAME" {
  zone_id = aws_route53_zone.shunkakinoki.zone_id
  name    = "infrastructure.${aws_route53_zone.shunkakinoki.name}"
  type    = "CNAME"
  records = ["shunkakinoki.github.io"]
  ttl     = "300"
}

resource "aws_route53_record" "notebook_shunkakinoki_com_CNAME" {
  zone_id = aws_route53_zone.shunkakinoki.zone_id
  name    = "notebook.${aws_route53_zone.shunkakinoki.name}"
  type    = "CNAME"
  records = ["shunkakinoki.github.io"]
  ttl     = "300"
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
  records = ["shunkakinoki.github.io"]
  ttl     = "300"
}

resource "aws_route53_zone" "k8s_shunkakinoki" {
  name = "k8s.shunkakinoki.com"
}

resource "aws_route53_record" "k8s_shunkakinoki_com" {
  zone_id = aws_route53_zone.k8s_shunkakinoki.zone_id
  name    = aws_route53_zone.k8s_shunkakinoki.name
  type    = "NS"
  records = [
    "${aws_route53_zone.k8s_shunkakinoki.name_servers.0}",
    "${aws_route53_zone.k8s_shunkakinoki.name_servers.1}",
    "${aws_route53_zone.k8s_shunkakinoki.name_servers.2}",
    "${aws_route53_zone.k8s_shunkakinoki.name_servers.3}",
  ]
  ttl = "300"
}
