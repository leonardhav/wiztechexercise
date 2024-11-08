# ----- Global Config -----
region           = "eu-central-1"

# ----- VPC-Config -----
vpc_name         = "lhav-wiztechexercise-vpc-01"
vpc_cidr         = "10.0.0.0/16"
azs              = ["eu-central-1a", "eu-central-1b"]
private_subnets  = ["10.0.1.0/24"]
public_subnets   = ["10.0.101.0/24"]
enable_nat_gateway = true
single_nat_gateway = true
environment      = "dev"


# ----- S3-Config -----
bucket_name             = "lhav-wiztechexercise-s3-bucket-01"
acl                     = "public"
versioning_enabled      = true
block_public_acls       = true
block_public_policy     = true
ignore_public_acls      = true
restrict_public_buckets = true


# ----- MongoDB Config -----
instance_type        = "t2.micro"
mongo_db_username    = "dbuser"
mongo_db_password    = "Keins123"
ami                  = "ami-0745b7d4092315796"

// EKS Config

// LB Config

