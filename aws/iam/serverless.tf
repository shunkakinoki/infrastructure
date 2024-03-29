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
      "cloudfront:ListTagsForResource",
      "cloudfront:TagResource",
      "cloudfront:UntagResource",
      "cloudfront:UpdateDistribution",
      "iam:AttachRolePolicy",
      "iam:CreateRole",
      "iam:CreateServiceLinkedRole",
      "iam:DeleteRolePolicy",
      "iam:DeleteRolePolicy",
      "iam:GetRole",
      "iam:PassRole",
      "iam:PutRolePolicy",
      "iam:UpdateAssumeRolePolicy",
      "iam:UpdateAssumeRolePolicy",
      "lambda:CreateEventSourceMapping",
      "lambda:CreateEventSourceMapping",
      "lambda:CreateFunction",
      "lambda:DeleteFunction",
      "lambda:EnableReplication",
      "lambda:GetFunction",
      "lambda:GetFunctionConfiguration",
      "lambda:ListEventSourceMappings",
      "lambda:ListEventSourceMappings",
      "lambda:ListTags",
      "lambda:PublishVersion",
      "lambda:TagResource",
      "lambda:UntagResource",
      "lambda:UpdateFunctionCode",
      "lambda:UpdateFunctionConfiguration",
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "route53:ChangeResourceRecordSets",
      "route53:ListHostedZonesByName",
      "route53:ListResourceRecordSets",
      "s3:CreateBucket",
      "s3:GetAccelerateConfiguration",
      "s3:GetBucketTagging",
      "s3:GetBucketTagging",
      "s3:GetObject",
      "s3:ListBucket",
      "s3:PutAccelerateConfiguration",
      "s3:PutBucketPolicy",
      "s3:PutBucketTagging",
      "s3:PutObject",
      "sqs:CreateQueue",
      "sqs:DeleteQueue",
      "sqs:GetQueueAttributes",
      "sqs:ReceiveMessage",
      "sqs:SendMessage",
      "sqs:SetQueueAttributes",
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "serverless" {
  name   = "serverless"
  path   = "/serverless/"
  policy = data.aws_iam_policy_document.serverless.json
}

data "aws_iam_policy_document" "serverless_role" {
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
  name                = "serverless"
  path                = "/serverless/"
  assume_role_policy  = data.aws_iam_policy_document.serverless_role.json
  managed_policy_arns = [aws_iam_policy.serverless.arn]
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
