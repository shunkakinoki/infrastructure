provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "west"
  region = "us-west-2"
}

module "aws-iam" {
  source = "../../aws/iam"
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

module "github-repo" {
  source = "../../github/repo"
}

module "github-secret" {
  source            = "../../github/secret"
  ACCESS_TOKEN      = var.ACCESS_TOKEN
  NPM_TOKEN         = var.NPM_TOKEN
  NOTION_API_KEY    = var.NOTION_API_KEY
  VERCEL_TOKEN      = var.VERCEL_TOKEN
  VERCEL_ORG_ID     = var.VERCEL_ORG_ID
  VERCEL_PROJECT_ID = var.VERCEL_PROJECT_ID
}
