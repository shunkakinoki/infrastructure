resource "aws_s3_bucket" "shunkakinoki" {
  bucket = "shunkakinoki"
  acl    = "private"
}

resource "aws_s3_bucket" "shunkakinoki_workspace" {
  bucket = "shunkakinoki-workspace"
  acl    = "private"
}

resource "aws_s3_bucket" "shunkakinoki_com" {
  bucket = "shunkakinoki.com"
  acl    = "private"

  website {
    redirect_all_requests_to = "https://www.shunkakinoki.com"
  }
}

resource "aws_s3_bucket" "www_shunkakinoki_com" {
  bucket = "www.shunkakinoki.com"
  acl    = "private"
}

resource "aws_s3_bucket_policy" "shunkakinoki_com" {
  bucket = aws_s3_bucket.shunkakinoki_com.id
  policy = data.aws_iam_policy_document.s3_policy_shunkakinoki.json
}

resource "aws_cloudfront_origin_access_identity" "origin_access_identity_shunkakinoki" {
  comment = "shunkakinoki.com"
}

data "aws_iam_policy_document" "s3_policy_shunkakinoki" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.shunkakinoki_com.arn}/*"]
    principals {
      type        = "AWS"
      identifiers = ["${aws_cloudfront_origin_access_identity.origin_access_identity_shunkakinoki.iam_arn}"]
    }
  }
}
