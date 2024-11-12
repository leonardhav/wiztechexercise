# Output for EKS cluster endpoint
output "cluster_endpoint" {
  description = "The endpoint for the EKS Kubernetes API"
  value       = module.eks.cluster_endpoint
}

# Output for EKS cluster certificate authority data
output "cluster_certificate_authority_data" {
  description = "The certificate authority data for the EKS Kubernetes API"
  value       = module.eks.cluster_certificate_authority_data
}

# Output for EKS cluster ID
output "cluster_id" {
  description = "The ID of the EKS cluster"
  value       = module.eks.cluster_id
}

# Output for EKS cluster name
output "cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.eks.cluster_name
}

# Output for EKS cluster security group IDs
output "cluster_security_group_id" {
  description = "The security group ID for the EKS cluster"
  value       = module.eks.cluster_security_group_id
}

# Output for EKS node group role ARN
output "node_group_role_arn" {
  description = "The role ARN for the EKS node group"
  value       = module.eks.eks_managed_node_group_role_arn
}
