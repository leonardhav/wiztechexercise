resource "aws_iam_role" "config_role" {
  name               = "AWS_ConfigRole"
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
  name   = "AWSConfigPolicy"
  role   = aws_iam_role.config_role.id
  policy = data.aws_iam_policy_document.config_policy_document.json
}

data "aws_iam_policy_document" "config_policy_document" {
  statement {
    actions = [
      "acm:DescribeCertificate",
      "acm:ListCertificates",
      "acm:ListTagsForCertificate",
      "apigateway:GET",
      "application-autoscaling:DescribeScalableTargets",
      "application-autoscaling:DescribeScalingPolicies",
      "autoscaling:DescribeAutoScalingGroups",
      "autoscaling:DescribeLaunchConfigurations",
      "autoscaling:DescribeLifecycleHooks",
      "autoscaling:DescribePolicies",
      "autoscaling:DescribeScheduledActions",
      "autoscaling:DescribeTags",
      "backup:DescribeBackupVault",
      "backup:DescribeRecoveryPoint",
      "backup:GetBackupPlan",
      "backup:GetBackupSelection",
      "backup:GetBackupVaultAccessPolicy",
      "backup:GetBackupVaultNotifications",
      "backup:ListBackupPlans",
      "backup:ListBackupSelections",
      "backup:ListBackupVaults",
      "backup:ListRecoveryPointsByBackupVault",
      "backup:ListTags",
      "cloudformation:DescribeType",
      "cloudformation:ListTypes",
      "cloudfront:ListTagsForResource",
      "cloudtrail:DescribeTrails",
      "cloudtrail:GetEventSelectors",
      "cloudtrail:GetTrailStatus",
      "cloudtrail:ListTags",
      "cloudwatch:DescribeAlarms",
      "codepipeline:GetPipeline",
      "codepipeline:GetPipelineState",
      "codepipeline:ListPipelines",
      "config:BatchGet*",
      "config:Describe*",
      "config:Get*",
      "config:List*",
      "config:Put*",
      "config:Select*",
      "dax:DescribeClusters",
      "dms:DescribeReplicationInstances",
      "dms:DescribeReplicationSubnetGroups",
      "dms:ListTagsForResource",
      "dynamodb:DescribeContinuousBackups",
      "dynamodb:DescribeLimits",
      "dynamodb:DescribeTable",
      "dynamodb:ListTables",
      "dynamodb:ListTagsOfResource",
      "ec2:Describe*",
      "ec2:GetEbsEncryptionByDefault",
      "ecr:DescribeRepositories",
      "ecr:GetLifecyclePolicy",
      "ecr:GetRepositoryPolicy",
      "ecr:ListTagsForResource",
      "ecs:DescribeClusters",
      "ecs:DescribeServices",
      "ecs:DescribeTaskDefinition",
      "ecs:DescribeTaskSets",
      "ecs:ListClusters",
      "ecs:ListServices",
      "ecs:ListTagsForResource",
      "ecs:ListTaskDefinitions",
      "eks:DescribeCluster",
      "eks:DescribeNodegroup",
      "eks:ListClusters",
      "eks:ListNodegroups",
      "elasticache:DescribeCacheClusters",
      "elasticache:DescribeCacheParameterGroups",
      "elasticache:DescribeCacheSubnetGroups",
      "elasticache:DescribeReplicationGroups",
      "elasticfilesystem:DescribeAccessPoints",
      "elasticfilesystem:DescribeBackupPolicy",
      "elasticfilesystem:DescribeFileSystemPolicy",
      "elasticfilesystem:DescribeFileSystems",
      "elasticfilesystem:DescribeLifecycleConfiguration",
      "elasticfilesystem:DescribeMountTargets",
      "elasticfilesystem:DescribeMountTargetSecurityGroups",
      "elasticloadbalancing:DescribeListeners",
      "elasticloadbalancing:DescribeLoadBalancerAttributes",
      "elasticloadbalancing:DescribeLoadBalancerPolicies",
      "elasticloadbalancing:DescribeLoadBalancers",
      "elasticloadbalancing:DescribeRules",
      "elasticloadbalancing:DescribeTags",
      "elasticmapreduce:DescribeCluster",
      "elasticmapreduce:DescribeSecurityConfiguration",
      "elasticmapreduce:GetBlockPublicAccessConfiguration",
      "elasticmapreduce:ListClusters",
      "elasticmapreduce:ListInstances",
      "es:DescribeElasticsearchDomain",
      "es:DescribeElasticsearchDomains",
      "es:ListDomainNames",
      "es:ListTags",
      "guardduty:GetDetector",
      "guardduty:GetFindings",
      "guardduty:GetMasterAccount",
      "guardduty:ListDetectors",
      "guardduty:ListFindings",
      "iam:GenerateCredentialReport",
      "iam:GetAccountAuthorizationDetails",
      "iam:GetAccountPasswordPolicy",
      "iam:GetAccountSummary",
      "iam:GetCredentialReport",
      "iam:GetGroup",
      "iam:GetGroupPolicy",
      "iam:GetPolicy",
      "iam:GetPolicyVersion",
      "iam:GetRole",
      "iam:GetRolePolicy",
      "iam:GetUser",
      "iam:GetUserPolicy",
      "iam:ListAttachedGroupPolicies",
      "iam:ListAttachedRolePolicies",
      "iam:ListAttachedUserPolicies",
      "iam:ListEntitiesForPolicy",
      "iam:ListGroupPolicies",
      "iam:ListGroupsForUser",
      "iam:ListInstanceProfilesForRole",
      "iam:ListPolicyVersions",
      "iam:ListRolePolicies",
      "iam:ListUserPolicies",
      "iam:ListVirtualMFADevices",
      "kinesis:DescribeStreamSummary",
      "kinesis:ListStreams",
      "kinesis:ListTagsForStream",
      "kms:DescribeKey",
      "kms:GetKeyPolicy",
      "kms:GetKeyRotationStatus",
      "kms:ListKeys",
      "kms:ListResourceTags",
      "lambda:GetAlias",
      "lambda:GetFunction",
      "lambda:GetPolicy",
      "lambda:ListAliases",
      "lambda:ListFunctions",
      "logs:DescribeLogGroups",
      "organizations:DescribeOrganization",
      "rds:DescribeDBClusters",
      "rds:DescribeDBClusterSnapshotAttributes",
      "rds:DescribeDBClusterSnapshots",
      "rds:DescribeDBInstances",
      "rds:DescribeDBSecurityGroups",
      "rds:DescribeDBSnapshotAttributes",
      "rds:DescribeDBSnapshots",
      "rds:DescribeDBSubnetGroups",
      "rds:DescribeEventSubscriptions",
      "rds:ListTagsForResource",
      "redshift:DescribeClusterParameterGroups",
      "redshift:DescribeClusterParameters",
      "redshift:DescribeClusters",
      "redshift:DescribeClusterSecurityGroups",
      "redshift:DescribeClusterSnapshots",
      "redshift:DescribeClusterSubnetGroups",
      "redshift:DescribeEventSubscriptions",
      "redshift:DescribeLoggingStatus",
      "route53:GetHostedZone",
      "route53:ListHostedZones",
      "route53:ListHostedZonesByName",
      "route53:ListResourceRecordSets",
      "route53:ListTagsForResource",
      "s3:GetAccelerateConfiguration",
      "s3:GetAccessPoint",
      "s3:GetAccessPointPolicy",
      "s3:GetAccessPointPolicyStatus",
      "s3:GetAccountPublicAccessBlock",
      "s3:GetBucketAcl",
      "s3:GetBucketCORS",
      "s3:GetBucketLocation",
      "s3:GetBucketLogging",
      "s3:GetBucketNotification",
      "s3:GetBucketObjectLockConfiguration",
      "s3:GetBucketPolicy",
      "s3:GetBucketPublicAccessBlock",
      "s3:GetBucketRequestPayment",
      "s3:GetBucketTagging",
      "s3:GetBucketVersioning",
      "s3:GetBucketWebsite",
      "s3:GetEncryptionConfiguration",
      "s3:GetLifecycleConfiguration",
      "s3:GetReplicationConfiguration",
      "s3:ListAccessPoints",
      "s3:ListAllMyBuckets",
      "s3:ListBucket",
      "sagemaker:DescribeCodeRepository",
      "sagemaker:DescribeEndpointConfig",
      "sagemaker:DescribeNotebookInstance",
      "sagemaker:ListCodeRepositories",
      "sagemaker:ListEndpointConfigs",
      "sagemaker:ListNotebookInstances",
      "sagemaker:ListTags",
      "secretsmanager:ListSecrets",
      "secretsmanager:ListSecretVersionIds",
      "securityhub:describeHub",
      "shield:DescribeDRTAccess",
      "shield:DescribeProtection",
      "shield:DescribeSubscription",
      "sns:GetTopicAttributes",
      "sns:ListSubscriptions",
      "sns:ListTagsForResource",
      "sns:ListTopics",
      "sqs:GetQueueAttributes",
      "sqs:ListQueues",
      "sqs:ListQueueTags",
      "ssm:DescribeAutomationExecutions",
      "ssm:DescribeDocument",
      "ssm:GetAutomationExecution",
      "ssm:GetDocument",
      "ssm:ListDocuments",
      "storagegateway:ListGateways",
      "storagegateway:ListVolumes",
      "support:DescribeCases",
      "tag:GetResources",
      "waf-regional:GetLoggingConfiguration",
      "waf-regional:GetWebACL",
      "waf-regional:GetWebACLForResource",
      "waf:GetLoggingConfiguration",
      "waf:GetWebACL",
      "wafv2:GetLoggingConfiguration",
      "config:PutConfigurationRecorder",
      "config:PutDeliveryChannel",
      "config:BatchGetResourceConfig",
      "config:DescribeConfigRules",
      "config:GetComplianceDetailsByConfigRule",
      "config:GetResourceConfigHistory",
      "config:DeliverConfigSnapshot",
      "config:StartConfigRulesEvaluation",
      "config:PutConfigurationAggregator",
      "sns:Publish",
      "s3:PutObject",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = ["*"]
  }
}

resource "aws_config_configuration_recorder" "recorder" {
  name     = "AWSConfigRecorder"
  role_arn = aws_iam_role.config_role.arn

  recording_group {
    all_supported                 = true
    include_global_resource_types = true
  }
}

resource "aws_config_delivery_channel" "delivery_channel" {
  name           = "AWSConfigDeliveryChannel"
  s3_bucket_name = var.s3_bucket_name
  sns_topic_arn  = aws_sns_topic.config_notifications.arn
  s3_key_prefix  = "aws-config"
}

resource "aws_config_conformance_pack" "wasp" {
  name = "operational-best-practices-for-wasp"
  template_body = data.http.conformance_pack_wasp.body
}

data "http" "conformance_pack_wasp" {
  url = "https://raw.githubusercontent.com/awslabs/aws-config-rules/refs/heads/master/aws-config-conformance-packs/Operational-Best-Practices-for-AWS-Well-Architected-Security-Pillar.yaml"
}


resource "aws_config_conformance_pack" "eks" {
  name = "operational-best-practices-for-EKS"
  template_body = data.http.conformance_pack_eks.body
}

data "http" "conformance_pack_eks" {
  url = "https://raw.githubusercontent.com/awslabs/aws-config-rules/refs/heads/master/aws-config-conformance-packs/Security-Best-Practices-for-EKS.yaml"
}

resource "aws_config_conformance_pack" "s3" {
  name = "operational-best-practices-for-s3"
  template_body = data.http.conformance_pack_s3.body
}

data "http" "conformance_pack_s3" {
  url = "https://raw.githubusercontent.com/awslabs/aws-config-rules/refs/heads/master/aws-config-conformance-packs/Operational-Best-Practices-for-Amazon-S3.yaml"
}


resource "aws_config_config_rule" "ec2_instance_public_ip" {
  name = "ec2_instance_public_ip"
  source {
    owner             = "AWS"
    source_identifier = "EC2_INSTANCE_NO_PUBLIC_IP"
  }
}

resource "aws_config_config_rule" "aws_s3_bucket_public_access_block" {
  name = "aws_s3_bucket_public_access_block"
  source {
    owner             = "AWS"
    source_identifier = "S3_ACCESS_POINT_PUBLIC_ACCESS_BLOCKS"
  }
}

resource "aws_sns_topic" "config_notifications" {
  name = "config-notifications"
}

resource "aws_sns_topic_subscription" "email_subscription_to_teams" {
  topic_arn = aws_sns_topic.config_notifications.arn
  protocol  = "email"
  endpoint  = "d4672dba.havekost490.onmicrosoft.com@de.teams.ms" 
}

resource "aws_sns_topic_subscription" "email_subscription_to_admin" {
  topic_arn = aws_sns_topic.config_notifications.arn
  protocol  = "email"
  endpoint  = "leonard@havekost.org" 
}


resource "aws_sns_topic_policy" "config_policy" {
  arn = aws_sns_topic.config_notifications.arn

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowConfigToPublish"
        Effect = "Allow"
        Principal = {
          Service = "config.amazonaws.com"
        }
        Action   = "sns:Publish"
        Resource = aws_sns_topic.config_notifications.arn
      }
    ]
  })
}

resource "aws_config_configuration_recorder_status" "enabled" {
  name    = aws_config_configuration_recorder.recorder.name
  is_enabled = true
}

