# General
aws_region  = "us-east-1"
name_prefix = "secure-cicd"

# VPC
vpc_cidr           = "10.0.0.0/16"
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
availability_zones  = ["us-east-1a", "us-east-1b"]

# EKS
eks_cluster_desired_size = 2
eks_cluster_max_size     = 3
eks_cluster_min_size     = 2
instance_type            = "t3.small"

# Jenkins
jenkins_instance_type = "t3.medium"
key_name = "my-key"
ami_id = "ami-0973bdb02650a40d8"
