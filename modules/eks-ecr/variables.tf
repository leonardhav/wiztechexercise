variable "region" {
  description = "AWS region"
  type        = string
}

variable "vpc_id" {
  description = "ID of the existing VPC"
  type        = string
}

variable "subnet_id" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.24"
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

variable "ecr_repository_name" {
  description = "Name of the ECR repository"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "docker_image_name" {
  description = "Name of the Docker image"
  default     = "my-app"
}

variable "ami_type" {
  description = "EKS machine image type"
  type        = string
}