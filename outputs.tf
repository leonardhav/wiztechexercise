# ----- VPC Outputs ------
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets[0]
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets[0]
}

# ----- S3 Outputs -----
output "s3_bucket_id" {
  description = "The ID of the S3 bucket"
  value       = module.s3_bucket.s3_bucket_id
}

output "s3_bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = module.s3_bucket.s3_bucket_arn
}


# ----- EC2 Outputs -----
output "mongo_db_instance_id" {
  value = module.mongodb.mongo_db_instance_id
}

output "mongo_connection_string" {
  value = module.mongodb.connection_string
}