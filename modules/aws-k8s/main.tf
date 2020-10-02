resource "aws_s3_bucket" "k8s_shunkakinoki_com" {
  bucket = "k8s.shunkakinoki.com"
  acl    = "private"
  versioning {
    enabled = true
  }
}
