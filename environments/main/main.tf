provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "west"
  region = "us-west-2"
}

module "aws-cloudfront" {
  source = "../../aws/cloudfront"
}

module "aws-iam" {
  source = "../../aws/iam"
}

module "aws-k8s" {
  source = "../../aws/k8s"
  providers = {
    aws = aws.west
  }
}

module "aws-lambda" {
  source             = "../../aws/lambda"
  slack_aws_cost     = var.slack_aws_cost
  slack_aws_cost_log = var.slack_aws_cost_log
}

module "aws-route53" {
  source = "../../aws/route53"
}

module "aws-s3" {
  source = "../../aws/s3"
}

module "aws-vpc" {
  source = "../../aws/vpc"
  azs    = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f"]
}
