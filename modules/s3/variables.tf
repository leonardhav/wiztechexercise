variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "acl" {
  description = "The canned ACL to apply to the bucket"
  type        = string
  default     = "private"
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

variable "versioning_enabled" {
  description = "Whether to enable versioning for the bucket"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to add to the S3 bucket"
  type        = map(string)
  default     = {}
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