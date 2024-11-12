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

#### AWS Config Module
https://docs.aws.amazon.com/config/latest/developerguide/iamrole-permissions.html#:~:text=To%20record%20your%20AWS%20resource%20configurations%2C%20AWS%20Config,IAM%20role%20that%20you%20assign%20to%20AWS%20Config.


##### MongoDB Backup
https://github.com/sysboss/mongodb_backup
https://www.tsmean.com/articles/infrastructure/backup-mongodb-to-s3/


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
- mongodb needs a restart after deploy before communication is possible
- insufficient permissions AWS Config
- SNS Topic pending confirmation -> solved via mail



### commands 
#### Update Kube-Config for AWS Cloud Shell
- `aws eks update-kubeconfig --region eu-central-1 --name lhav-wiztechexercise-eks-01` 

#### Get the MongoDB Connection String from the Outputs and Paste in deployment.yaml

#### Create the deployment files for Container
- `sudo vim deployment.yaml` 
- `sudo vim service.yaml`

#### Deploy the Container and Service
- `kubectl apply -f deployment.yaml`
- `kubectl apply -f service.yaml`

#### get DNS name for Application
- `kubectl get svc`

#### Show wiztechexercise.txt in the Pod
- `kubectl get pods`
- `kubectl exec -it <pod-name> -- /bin/sh`
- `cat /tmp/wiztechexercise.txt`


### Teams Webhook

#### URL
https://havekost490.webhook.office.com/webhookb2/18a579d0-e7ab-410a-874f-6649b6723727@27483875-5c74-4b70-8497-d6bc031af783/IncomingWebhook/77fae1bffe144ea490fcc736bac1dbab/17efc37d-3ee0-4f82-a442-b1b95306c03a/V29gp6LGIcVbAQwrjssU54VZWGNPaiKVLK9y14Hfg9F6E1

#### Mailadresse 
9d841aba.havekost.org@de.teams.ms



