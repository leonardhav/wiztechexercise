# ----- Global Config -----
region = "eu-central-1"

# ----- VPC-Config -----
vpc_name           = "lhav-wiztechexercise-vpc-01"
vpc_cidr           = "10.0.0.0/16"
azs                = ["eu-central-1a", "eu-central-1b"]
private_subnets    = ["10.0.1.0/24", "10.0.2.0/24"]
public_subnets     = ["10.0.101.0/24", "10.0.102.0/24"]
enable_nat_gateway = true
single_nat_gateway = true
environment        = "dev"


# ----- S3-Config -----
bucket_name             = "lhav-wiztechexercise-s3-bucket-02"
acl                     = "public"
versioning_enabled      = true
block_public_acls       = false
block_public_policy     = false
ignore_public_acls      = false
restrict_public_buckets = false

# ----- S3 Policy ----- 
Sid       = "PublicReadGetObject"
Effect    = "Allow"
Principal = "*"
Action    = "s3:GetObject"


# ----- MongoDB Config -----
instance_type     = "t2.micro"
mongo_db_username = "dbuser"
mongo_db_password = "Keins123"
ami               = "ami-0745b7d4092315796"

# ----- EKS Config ------
cluster_name    = "lhav-wiztechexercise-eks-01"
cluster_version = "1.31"
min_size        = 1
max_size        = 3
desired_size    = 2
instance_types  = ["t3.medium"]
ami_type        = "AL2023_x86_64_STANDARD"


# ----- ECR Config ------
ecr_repository_name = "lhav-wiztechexercise-ecr-01"
docker_image_name   = "leonardhav/tasky-modified"


# ----- AWS Config -----
create_sns_topic                 = true
create_iam_role                  = true
global_resource_collector_region = "eu-central-1"
force_destroy                    = true
teams_url                        = "https://havekost490.webhook.office.com/webhookb2/18a579d0-e7ab-410a-874f-6649b6723727@27483875-5c74-4b70-8497-d6bc031af783/IncomingWebhook/70dbf9a0226c4bbaad25cfe9697e4c77/17efc37d-3ee0-4f82-a442-b1b95306c03a/V2qgbW8X8SYZd83DEhQmBGK1wMpBaqiSmct18y8TxR7ec1"
authorized_account_id            = "147997145269"