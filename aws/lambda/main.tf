resource "null_resource" "aws_lambda_cost" {
  triggers = {
    source_code_hash = filebase64sha256("${path.module}/main.py")
  }
}

data "archive_file" "aws_lambda_cost" {
  type        = "zip"
  source_file = "${path.module}/main.py"
  output_path = "${path.module}/lambda.zip"
  depends_on  = [null_resource.aws_lambda_cost]
}

data "aws_iam_policy_document" "lambda" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "aws_lambda_cost" {
  name               = "aws-lambda-cost"
  assume_role_policy = data.aws_iam_policy_document.lambda.json
}

data "aws_iam_policy_document" "cloudwatch_log" {
  statement {
    effect = "Allow"
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]
    resources = [
      "arn:aws:logs:*:*:*"
    ]
  }
}

resource "aws_iam_role_policy" "cloudwatch_log" {
  name   = "aws-lambda-cost-cloudwatch-log"
  role   = aws_iam_role.aws_lambda_cost.id
  policy = data.aws_iam_policy_document.cloudwatch_log.json
}

data "aws_iam_policy_document" "cloudwatch_sts" {
  statement {
    effect = "Allow"
    actions = [
      "cloudwatch:Describe*",
      "cloudwatch:Get*",
      "cloudwatch:List*"
    ]
    resources = [
      "*"
    ]
  }
}

resource "aws_iam_role_policy" "cloudwatch_sts" {
  name   = "aws-lambda-cost-cloudwatch-sts"
  role   = aws_iam_role.aws_lambda_cost.id
  policy = data.aws_iam_policy_document.cloudwatch_sts.json
}

resource "aws_cloudwatch_event_rule" "aws_lambda_cost" {
  name                = "aws-lambda-cost"
  description         = "Every day 0:00"
  schedule_expression = "cron(0 0 * * ? *)"
}

resource "aws_cloudwatch_event_target" "aws_lambda_cost" {
  target_id = "aws-lambda-cost"
  rule      = aws_cloudwatch_event_rule.aws_lambda_cost.name
  arn       = aws_lambda_function.aws_lambda_cost.arn
}

resource "aws_lambda_permission" "aws_lambda_cost" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  principal     = "events.amazonaws.com"
  function_name = aws_lambda_function.aws_lambda_cost.function_name
  source_arn    = aws_cloudwatch_event_rule.aws_lambda_cost.arn
}

resource "aws_lambda_function" "aws_lambda_cost" {
  filename         = "${path.module}/lambda.zip"
  function_name    = "aws-lambda-cost"
  role             = aws_iam_role.aws_lambda_cost.arn
  handler          = "main.lambda_handler"
  source_code_hash = data.archive_file.aws_lambda_cost.output_base64sha256
  runtime          = "python3.7"
  environment {
    variables = {
      SLACK_CHANNEL_NAME = "aws-cost"
      SLACK_POST_URL     = var.slack_aws_cost
    }
  }
}

resource "aws_cloudwatch_event_rule" "aws_lambda_cost_log" {
  name                = "aws-lambda-cost-log"
  description         = "Every 30 minutes"
  schedule_expression = "cron(0/30 * * * ? *)"
}

resource "aws_cloudwatch_event_target" "aws_lambda_cost_log" {
  target_id = "aws-lambda-cost-log"
  rule      = aws_cloudwatch_event_rule.aws_lambda_cost_log.name
  arn       = aws_lambda_function.aws_lambda_cost_log.arn
}

resource "aws_lambda_permission" "aws_lambda_cost_log" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  principal     = "events.amazonaws.com"
  function_name = aws_lambda_function.aws_lambda_cost_log.function_name
  source_arn    = aws_cloudwatch_event_rule.aws_lambda_cost_log.arn
}

resource "aws_lambda_function" "aws_lambda_cost_log" {
  filename         = "${path.module}/lambda.zip"
  function_name    = "aws-lambda-cost-log"
  role             = aws_iam_role.aws_lambda_cost.arn
  handler          = "main.lambda_handler"
  source_code_hash = data.archive_file.aws_lambda_cost.output_base64sha256
  runtime          = "python3.7"
  environment {
    variables = {
      SLACK_CHANNEL_NAME = "aws-cost-log"
      SLACK_POST_URL     = var.slack_aws_cost_log
    }
  }
}
