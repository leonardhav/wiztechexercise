# ----- Global Variables -----

variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

# ----- VPC Variables -----

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "azs" {
  description = "Availability Zones"
  type        = list(string)
}

variable "private_subnets" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

variable "public_subnets" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Enable NAT Gateway"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Use a single NAT Gateway"
  type        = bool
  default     = true
}

variable "environment" {
  description = "Environment name"
  type        = string
}


# ----- S3 Variables -----
variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "versioning_enabled" {
  description = "Whether to enable versioning for the bucket"
  type        = bool
  default     = true
}

variable "block_public_acls" {
  description = "Whether Amazon S3 should block public ACLs for this bucket"
  type        = bool
  default     = true
}

variable "block_public_policy" {
  description = "Whether Amazon S3 should block public bucket policies for this bucket"
  type        = bool
  default     = true
}

variable "ignore_public_acls" {
  description = "Whether Amazon S3 should ignore public ACLs for this bucket"
  type        = bool
  default     = true
}

variable "restrict_public_buckets" {
  description = "Whether Amazon S3 should restrict public bucket policies for this bucket"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to add to the S3 bucket"
  type        = map(string)
  default     = {}
}

variable "acl" {
  description = "The canned ACL to apply to the bucket"
  type        = string
  default     = "private"
}

variable "Sid" {
  description = "Sid for Bucket Policy"
  type        = string
}

variable "Effect" {
  description = "Effect of the buckets policy"
  type        = string
}

variable "Principal" {
  description = "The Principal of the policy"
  type        = string
}

variable "Action" {
  description = "Policy Action"
  type        = string
}

# ----- MongoDB Variables -----
variable "instance_type" {
  description = "Instance type for the MongoDB EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "mongo_db_username" {
  description = "Username for MongoDB authentication"
  type        = string
}

variable "mongo_db_password" {
  description = "Password for MongoDB authentication"
  type        = string
  sensitive   = true
}

variable "ami" {
  description = "AMI ID for the MongoDB EC2 instance"
  type        = string
}

# ----- EKS Variables ------
variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
}

variable "cluster_version" {
  description = "EKS Cluster Version"
  type        = string
}

variable "min_size" {
  description = "Minimum number of nodes in the EKS node group"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of nodes in the EKS node group"
  type        = number
  default     = 3
}

variable "desired_size" {
  description = "Desired number of nodes in the EKS node group"
  type        = number
  default     = 2
}

variable "instance_types" {
  description = "List of EC2 instance types for the EKS node group"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "ami_type" {
  description = "EKS machine image type"
  type        = string
}


# ------ ECR Variables -----
variable "ecr_repository_name" {
  description = "Repository Name of ECR"
  type        = string
}

variable "docker_image_name" {
  description = "Name of the Docker image"
  default     = "my-app"
}

