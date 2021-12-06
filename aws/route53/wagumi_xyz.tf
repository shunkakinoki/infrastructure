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
  records = ["76.76.21.21"]
  ttl = "300"
}

resource "aws_route53_record" "www_wagumi_xyz_CNAME" {
  zone_id = aws_route53_zone.wagumi_xyz.zone_id
  name    = "www.${aws_route53_zone.wagumi_xyz.name}"
  type    = "CNAME"
  records = ["cname.vercel-dns.com"]
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
  records = ["cname.vercel-dns.com"]
  ttl     = "300"
}
