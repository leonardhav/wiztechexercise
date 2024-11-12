# Wiz Technical Exercise 

## Author: Leonard Havekost

### Ressources used for Terraform Script


#### VPC-Module
- https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest

#### EKS Module
https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest
https://github.com/terraform-aws-modules/terraform-aws-eks/blob/master/examples/eks-managed-node-group/eks-al2.tf

#### EKS Config
https://docs.aws.amazon.com/eks/latest/userguide/create-kubeconfig.html

##### MongoDB Backup
https://github.com/sysboss/mongodb_backup

#### EKS Basics
https://learn.acloud.guru/course/eks-basics/dashboard


### Constraints 

- dynamic AMI 
- which ressources will be a module, which may not?
- how do i configure the eks cluster and the registry? 
- s3 bucket block public access policy
- how to structure the terraform
- eks basics (only worked with K8S before)
- how to schedule the database backup inside terraform 


