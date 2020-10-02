resource "aws_acm_certificate" "shunkakinoki_com" {
  domain_name = "shunkakinoki.com"
  subject_alternative_names = [
    "*.shunkakinoki.com"
  ]
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

data "aws_route53_zone" "zone_shunkakinoki_com" {
  name         = "shunkakinoki.com."
  private_zone = false
}

resource "aws_route53_record" "cert_validation_shunkakinoki_com" {
  name    = tolist(aws_acm_certificate.shunkakinoki_com.domain_validation_options)[0].resource_record_name
  type    = tolist(aws_acm_certificate.shunkakinoki_com.domain_validation_options)[0].resource_record_type
  zone_id = data.aws_route53_zone.zone_shunkakinoki_com.id
  records = [tolist(aws_acm_certificate.shunkakinoki_com.domain_validation_options)[0].resource_record_value]
  ttl     = 60
}

resource "aws_acm_certificate_validation" "cert_shunkakinoki_com" {
  certificate_arn         = aws_acm_certificate.shunkakinoki_com.arn
  validation_record_fqdns = [aws_route53_record.cert_validation_shunkakinoki_com.fqdn]
}

data "aws_s3_bucket" "shunkakinoki_com" {
  bucket = "shunkakinoki.com"
}

resource "aws_cloudfront_distribution" "shunkakinoki_com" {
  aliases = [
    "shunkakinoki.com",
  ]

  enabled = true

  default_cache_behavior {
    allowed_methods = [
      "GET",
      "HEAD",
    ]
    cached_methods = [
      "GET",
      "HEAD",
    ]
    compress               = false
    default_ttl            = 86400
    max_ttl                = 31536000
    min_ttl                = 0
    smooth_streaming       = false
    target_origin_id       = "S3-shunkakinoki.com"
    trusted_signers        = []
    viewer_protocol_policy = "redirect-to-https"

    forwarded_values {
      headers                 = []
      query_string            = true
      query_string_cache_keys = []

      cookies {
        forward           = "all"
        whitelisted_names = []
      }
    }
  }

  origin {
    domain_name = data.aws_s3_bucket.shunkakinoki_com.website_endpoint
    origin_id   = "S3-shunkakinoki.com"

    custom_origin_config {
      http_port                = 80
      https_port               = 443
      origin_keepalive_timeout = 5
      origin_protocol_policy   = "http-only"
      origin_read_timeout      = 30
      origin_ssl_protocols = [
        "TLSv1",
        "TLSv1.1",
        "TLSv1.2",
      ]
    }
  }

  restrictions {
    geo_restriction {
      locations        = []
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn = aws_acm_certificate.shunkakinoki_com.arn
    ssl_support_method  = "sni-only"
  }
}
