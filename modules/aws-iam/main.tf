data "aws_iam_policy_document" "admin" {
  statement {
    effect    = "Allow"
    actions   = ["*"]
    resources = ["*"]
  }
}

resource "aws_iam_group_policy" "admin" {
  name   = "admin"
  group  = aws_iam_group.admin.id
  policy = data.aws_iam_policy_document.admin.json
}


resource "aws_iam_group" "admin" {
  name = "admin"
  path = "/admin/"
}

resource "aws_iam_user_group_membership" "admin" {
  user = aws_iam_user.admin.name
  groups = [
    aws_iam_group.admin.name
  ]
}

resource "aws_iam_user" "admin" {
  name = "admin"
}

resource "aws_iam_user_group_membership" "admin_macbook_pro" {
  user = aws_iam_user.admin_macbook_pro.name
  groups = [
    aws_iam_group.admin.name
  ]
}

resource "aws_iam_access_key" "admin_macbook_pro" {
  user = aws_iam_user.admin_macbook_pro.name
}

resource "aws_iam_user" "admin_macbook_pro" {
  name = "admin-macbook-pro"
}

resource "aws_iam_group_policy" "admin_terraform_cloud" {
  name   = "admin-terraform-cloud"
  group  = aws_iam_group.admin_terraform_cloud.id
  policy = data.aws_iam_policy_document.admin.json
}

resource "aws_iam_group" "admin_terraform_cloud" {
  name = "admin-terraform-cloud"
  path = "/admin_terraform_cloud/"
}

resource "aws_iam_user_group_membership" "admin_terraform_cloud" {
  user = aws_iam_user.admin_terraform_cloud.name
  groups = [
    aws_iam_group.admin_terraform_cloud.name
  ]
}

resource "aws_iam_access_key" "admin_terraform_cloud" {
  user = aws_iam_user.admin_terraform_cloud.name
}

resource "aws_iam_user" "admin_terraform_cloud" {
  name = "admin-terraform-cloud"
}

resource "aws_iam_group_policy" "admin_github_actions" {
  name   = "admin-github-actions"
  group  = aws_iam_group.admin_github_actions.id
  policy = data.aws_iam_policy_document.admin.json
}

resource "aws_iam_group" "admin_github_actions" {
  name = "admin-github-actions"
  path = "/admin_github_actions/"
}

resource "aws_iam_user_group_membership" "admin_github_actions" {
  user = aws_iam_user.admin_github_actions.name
  groups = [
    aws_iam_group.admin_github_actions.name
  ]
}

resource "aws_iam_access_key" "admin_github_actions" {
  user = aws_iam_user.admin_github_actions.name
}

resource "aws_iam_user" "admin_github_actions" {
  name = "admin-github-actions"
}
