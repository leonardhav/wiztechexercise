# ----- VPC Outputs ------
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
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
  sensitive = true
}

# ----- EKS Outputs -----

output "cluster_endpoint" {
  description = "The endpoint for the EKS Kubernetes API"
  value       = module.eks.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  description = "The certificate authority data for the EKS Kubernetes API"
  value       = module.eks.cluster_certificate_authority_data
}


output "cluster_id" {
  description = "The ID of the EKS cluster"
  value       = module.eks.cluster_id
}


output "cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.eks.cluster_name
}


output "cluster_security_group_id" {
  description = "The security group ID for the EKS cluster"
  value       = module.eks.cluster_security_group_id
}


output "node_group_role_arn" {
  description = "The role ARN for the EKS node group"
  value       = module.eks.eks_managed_node_group_role_arn
}