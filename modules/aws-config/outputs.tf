# outputs.tf - AWS Config Module

output "configuration_recorder_name" {
  value = aws_config_configuration_recorder.recorder.name
}

output "config_role_arn" {
  value = aws_iam_role.config_role.arn
}

output "sns_topic_arn" {
  value = aws_sns_topic.config_notifications.arn
}
