# variables.tf - AWS Config Module

variable "configuration_recorder_name" {
  description = "Name of the AWS Config Configuration Recorder"
  type        = string
  default     = "default-config-recorder"
}

variable "config_role_arn" {
  description = "IAM role ARN for AWS Config"
  type        = string
}

variable "delivery_channel_name" {
  description = "Name of the AWS Config Delivery Channel"
  type        = string
  default     = "default-delivery-channel"
}

variable "s3_bucket_name" {
  description = "S3 Bucket name for storing AWS Config data"
  type        = string
}

variable "sns_topic_arn" {
  description = "SNS Topic ARN for sending notifications from AWS Config"
  type        = string
}

variable "config_role_name" {
  description = "IAM Role name for AWS Config"
  type        = string
  default     = "config-role"
}

variable "config_policy_name" {
  description = "IAM Policy name for AWS Config"
  type        = string
  default     = "config-policy"
}

variable "s3_key_prefix" {
  description = "S3 Key Prefix for AWS Config Delivery Channel"
  type        = string
  default     = "aws-config-data"
}

variable "teams_url" {
  description = "Webhook URL for Teams"
  type        = string
}

variable "authorized_account_id" {
  description = "AWS Account ID"
  type        = string
}


