data "aws_iam_policy_document" "github" {
  statement {
    effect = "Allow"
    actions = [
      "acm:DescribeCertificate",
      "acm:ListCertificates",
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
      "sqs:SetQueueAttributes",
    ]
    resources = ["*"]
  }
}

resource "aws_iam_group_policy" "github" {
  name   = "github"
  group  = aws_iam_group.github.id
  policy = data.aws_iam_policy_document.github.json
}

resource "aws_iam_group" "github" {
  name = "github"
  path = "/github/"
}

resource "aws_iam_user_group_membership" "github" {
  user = aws_iam_user.github.name
  groups = [
    aws_iam_group.github.name
  ]
}

resource "aws_iam_user" "github" {
  name = "github"
}
