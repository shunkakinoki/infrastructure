resource "aws_route53_zone" "wagumi_xyz" {
  name = "wagumi.xyz"
}

resource "aws_route53_record" "wagumi_xyz" {
  allow_overwrite = true

  zone_id = aws_route53_zone.wagumi_xyz.zone_id
  name    = aws_route53_zone.wagumi_xyz.name
  type    = "NS"
  records = [
    aws_route53_zone.wagumi_xyz.name_servers.0,
    aws_route53_zone.wagumi_xyz.name_servers.1,
    aws_route53_zone.wagumi_xyz.name_servers.2,
    aws_route53_zone.wagumi_xyz.name_servers.3,
  ]
  ttl = "300"
}

resource "aws_route53_record" "wagumi_xyz_A" {
  zone_id = aws_route53_zone.wagumi_xyz.zone_id
  name    = aws_route53_zone.wagumi_xyz.name
  type    = "A"
  records = [
    "185.199.108.153",
    "185.199.109.153",
    "185.199.110.153",
    "185.199.111.153",
  ]
  ttl = "300"
}

resource "aws_route53_record" "www_wagumi_xyz_CNAME" {
  zone_id = aws_route53_zone.wagumi_xyz.zone_id
  name    = "www.${aws_route53_zone.wagumi_xyz.name}"
  type    = "CNAME"
  records = ["wagumi.github.io"]
  ttl     = "300"
}

resource "aws_route53_record" "airdrop_wagumi_xyz_CNAME" {
  zone_id = aws_route53_zone.wagumi_xyz.zone_id
  name    = "airdrop.${aws_route53_zone.wagumi_xyz.name}"
  type    = "CNAME"
  records = ["cname.vercel-dns.com"]
  ttl     = "300"
}

resource "aws_route53_record" "cats_wagumi_xyz_CNAME" {
  zone_id = aws_route53_zone.wagumi_xyz.zone_id
  name    = "cats.${aws_route53_zone.wagumi_xyz.name}"
  type    = "CNAME"
  records = ["wagumi.github.io"]
  ttl     = "300"
}

resource "aws_route53_record" "rinkeby_cats_wagumi_xyz_CNAME" {
  zone_id = aws_route53_zone.wagumi_xyz.zone_id
  name    = "rinkeby.cats.${aws_route53_zone.wagumi_xyz.name}"
  type    = "CNAME"
  records = ["wagumi.github.io"]
  ttl     = "300"
}

resource "aws_route53_record" "gov_wagumi_xyz_CNAME" {
  zone_id = aws_route53_zone.wagumi_xyz.zone_id
  name    = "gov.${aws_route53_zone.wagumi_xyz.name}"
  type    = "CNAME"
  records = ["snapshotpage.b-cdn.net"]
  ttl     = "300"
}


resource "aws_route53_record" "mail_wagumi_xyz_A" {
  zone_id = aws_route53_zone.wagumi_xyz.zone_id
  name    = "mail.${aws_route53_zone.wagumi_xyz.name}"
  type    = "A"
  records = [
    "157.7.184.37",
  ]
  ttl = "300"
}

resource "aws_route53_record" "wagumi_xyz_MX" {
  zone_id = aws_route53_zone.wagumi_xyz.zone_id
  name    = aws_route53_zone.wagumi_xyz.name
  type    = "MX"
  ttl     = "300"
  records = [
    "10 mail.wagumi.xyz",
  ]
}
 
resource "aws_route53_record" "wagumi_xyz_TXT" {
  zone_id = aws_route53_zone.wagumi_xyz.zone_id
  name    = aws_route53_zone.wagumi_xyz.name
  type    = "TXT"
  ttl     = "300"
  records = [
    "v=spf1 ip4:157.7.184.37 ~all",
  ]
}

resource "aws_route53_record" "wagumi_xyz_dmarc" {
  zone_id = aws_route53_zone.wagumi_xyz.zone_id
  name    = "_dmarc.${aws_route53_zone.wagumi_xyz.name}"
  type    = "TXT"
  ttl     = "300"
  records = [
    "v=DMARC1; p=reject; sp=reject; adkim=s; aspf=s;",
  ]
}
