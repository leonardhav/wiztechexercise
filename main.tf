# Configure the AWS Provider
provider "aws" {
  region = var.region
}


# Create VPC
module "vpc" {
  source = "./modules/vpc"

  region          = var.region
  vpc_name        = var.vpc_name
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  environment     = var.environment
  azs             = var.azs

}

# Create S3 Bucket

module "s3_bucket" {
  source = "./modules/s3"

  region                  = var.region
  bucket_name             = var.bucket_name
  acl                     = var.acl
  versioning_enabled      = var.versioning_enabled
  tags                    = var.tags
  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
  Sid                     = var.Sid
  Effect                  = var.Effect
  Principal               = var.Principal
  Action                  = var.Action
}



# Create EC2 Instance with MongoDB

module "mongodb" {
  source            = "./modules/mongodb"
  instance_type     = var.instance_type
  vpc_id            = module.vpc.vpc_id
  vpc_cidr          = var.vpc_cidr
  subnet_id         = module.vpc.public_subnets[0]
  bucket_name       = var.bucket_name
  mongo_db_username = var.mongo_db_username
  mongo_db_password = var.mongo_db_password
  ami               = var.ami

}


# Create EKS Cluster and Container Registry

module "eks_ecr" {
  source = "./modules/eks-ecr"

  region          = var.region
  vpc_id          = module.vpc.vpc_id
  subnet_id       = module.vpc.private_subnets
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  ami_type        = var.ami_type


  tags = {
    Environment = "production"
    Project     = "MyApp"
  }
}

# Create AWS Config

module "aws_config" {
  source                = "./modules/aws-config"
  teams_url             = var.teams_url
  authorized_account_id = var.authorized_account_id
  s3_bucket_name        = var.bucket_name
  config_role_arn       = module.aws_config.config_role_arn
  sns_topic_arn         = module.aws_config.sns_topic_arn

}




