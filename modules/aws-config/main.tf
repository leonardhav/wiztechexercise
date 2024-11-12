resource "aws_iam_role" "config_role" {
  name               = "AWSConfigRole"
  assume_role_policy = data.aws_iam_policy_document.config_assume_role_policy.json
}

data "aws_iam_policy_document" "config_assume_role_policy" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type        = "Service"
      identifiers = ["config.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy" "config_policy" {
  name = "AWSConfigPolicy"
  role = aws_iam_role.config_role.id
  policy = data.aws_iam_policy_document.config_policy_document.json
}

data "aws_iam_policy_document" "config_policy_document" {
  statement {
    actions = [
      "config:PutConfigurationRecorder",
      "config:PutDeliveryChannel",
      "config:BatchGetResourceConfig",
      "config:DescribeConfigRules",
      "config:GetComplianceDetailsByConfigRule",
      "config:GetResourceConfigHistory"
    ]
    resources = ["*"]
  }
}

resource "aws_config_configuration_recorder" "recorder" {
  name     = "AWSConfigRecorder"
  role_arn = aws_iam_role.config_role.arn

  recording_group {
    all_supported               = true
    include_global_resource_types = true
  }
}

resource "aws_config_delivery_channel" "delivery_channel" {
  name           = "AWSConfigDeliveryChannel"
  s3_bucket_name = var.s3_bucket_name
  sns_topic_arn  = aws_sns_topic.config_notifications.arn
  s3_key_prefix  = "aws-config"
}


resource "aws_config_config_rule" "ec2_instance_public_ip" {
  name        = "ec2_instance_public_ip"
  source {
    owner             = "AWS"
    source_identifier = "EC2_INSTANCE_NO_PUBLIC_IP"
  }
}

resource "aws_config_config_rule" "aws_s3_bucket_public_access_block" {
  name        = "aws_s3_bucket_public_access_block"
  source {
    owner             = "AWS"
    source_identifier = "S3_ACCESS_POINT_PUBLIC_ACCESS_BLOCKS"
  }
}

resource "aws_sns_topic" "config_notifications" {
  name = "config-notifications"
}

resource "aws_sns_topic_subscription" "teams_webhook" {
  topic_arn = aws_sns_topic.config_notifications.arn
  protocol  = "https"
  endpoint  = var.teams_url
}
