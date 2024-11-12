# ------ EKS Cluster ------
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  
  cluster_addons = {
    coredns                = {}
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
  }

  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_id

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true
  
  eks_managed_node_groups = {
    default = {
      min_size     = var.min_size
      max_size     = var.max_size
      desired_size = var.desired_size
      ami_type       = var.ami_type
      instance_types = var.instance_types
    }
  }
  enable_cluster_creator_admin_permissions = true
}


