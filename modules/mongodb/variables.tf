# Variables for configuration
variable "instance_type" {
  description = "Instance type for the MongoDB EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "vpc_id" {
  description = "ID of the VPC where the MongoDB instance will be deployed"
  type        = string
}

variable "vpc_cidr" {
  description = "ID of the VPC where the MongoDB instance will be deployed"
  type        = string
}

variable "subnet_id" {
  description = "ID of the Subnet for the MongoDB instance"
  type        = string
}

variable "bucket_name" {
  description = "The name of the S3 bucket for MongoDB backups"
  type        = string
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
