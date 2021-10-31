data "aws_iam_policy_document" "serverless" {
  statement {
    effect = "Allow"
    actions = [
      "acm:DescribeCertificate",
      "acm:ListCertificates",
      "acm:RequestCertificate",
      "cloudfront:CreateCloudFrontOriginAccessIdentity",
      "cloudfront:CreateDistribution",
      "cloudfront:CreateInvalidation",
      "cloudfront:GetDistribution",
      "cloudfront:GetDistributionConfig",
      "cloudfront:ListCloudFrontOriginAccessIdentities",
      "cloudfront:ListDistributions",
      "cloudfront:ListDistributionsByLambdaFunction",
      "cloudfront:ListDistributionsByWebACLId",
      "cloudfront:ListFieldLevelEncryptionConfigs",
      "cloudfront:ListFieldLevelEncryptionProfiles",
      "cloudfront:ListInvalidations",
      "cloudfront:ListPublicKeys",
      "cloudfront:ListStreamingDistributions",
      "cloudfront:UpdateDistribution",
      "cloudfront:TagResource",
      "cloudfront:UntagResource",
      "cloudfront:ListTagsForResource",
      "iam:AttachRolePolicy",
      "iam:CreateRole",
      "iam:CreateServiceLinkedRole",
      "iam:GetRole",
      "iam:PutRolePolicy",
      "iam:PassRole",
      "lambda:CreateFunction",
      "lambda:EnableReplication",
      "lambda:DeleteFunction",
      "lambda:GetFunction",
      "lambda:GetFunctionConfiguration",
      "lambda:PublishVersion",
      "lambda:UpdateFunctionCode",
      "lambda:UpdateFunctionConfiguration",
      "lambda:ListTags",
      "lambda:TagResource",
      "lambda:UntagResource",
      "route53:ChangeResourceRecordSets",
      "route53:ListHostedZonesByName",
      "route53:ListResourceRecordSets",
      "s3:CreateBucket",
      "s3:GetAccelerateConfiguration",
      "s3:GetObject",
      "s3:ListBucket",
      "s3:PutAccelerateConfiguration",
      "s3:PutBucketPolicy",
      "s3:PutObject",
      "s3:PutBucketTagging",
      "s3:GetBucketTagging",
      "lambda:ListEventSourceMappings",
      "lambda:CreateEventSourceMapping",
      "iam:UpdateAssumeRolePolicy",
      "iam:DeleteRolePolicy",
      "sqs:CreateQueue",
      "sqs:DeleteQueue",
      "sqs:GetQueueAttributes",
      "sqs:SetQueueAttributes"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "serverless" {
  name   = "serverless"
  path   = "/serverless/"
  policy = data.aws_iam_policy_document.serverless.json
}

data "aws_iam_policy_document" "serverless" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type = "Service"
      identifiers = [
        "lambda.amazonaws.com",
        "edgelambda.amazonaws.com"
      ]
    }
  }
}

resource "aws_iam_role" "serverless" {
  name               = "serverless"
  path               = "/serverless/"
  assume_role_policy = data.aws_iam_policy_document.serverless.json
}

resource "aws_iam_group_policy" "serverless" {
  name   = "serverless"
  group  = aws_iam_group.serverless.id
  policy = data.aws_iam_policy_document.serverless.json
}

resource "aws_iam_group" "serverless" {
  name = "serverless"
  path = "/serverless/"
}

resource "aws_iam_user_group_membership" "serverless" {
  user = aws_iam_user.serverless.name
  groups = [
    aws_iam_group.serverless.name
  ]
}

resource "aws_iam_user" "serverless" {
  name = "serverless"
}
