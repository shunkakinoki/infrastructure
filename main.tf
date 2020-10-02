provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "west"
  region = "us-west-2"
}

module "aws-cloudfront" {
  source = "./modules/aws-cloudfront"
}

module "aws-iam" {
  source = "./modules/aws-iam"
}

module "aws-k8s" {
  source = "./modules/aws-k8s"
  providers = {
    aws = aws.west
  }
}

module "aws-lambda-cost" {
  slack_aws_cost     = var.slack_aws_cost
  slack_aws_cost_log = var.slack_aws_cost_log
  source             = "./modules/aws-lambda-cost"
}

module "aws-route-53" {
  source = "./modules/aws-route-53"
}

module "aws-s3-bucket" {
  source = "./modules/aws-s3-bucket"
}

module "aws-vpc" {
  source = "./modules/aws-vpc"
  azs    = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f"]
}
