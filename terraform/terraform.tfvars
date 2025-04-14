# General
aws_region  = "us-east-1"
name_prefix = "secure-cicd"

# VPC
vpc_cidr_block             = "10.0.0.0/16"
subnet_cidr_blocks_public  = ["10.0.1.0/24", "10.0.3.0/24"]
subnet_cidr_blocks_private = ["10.0.2.0/24", "10.0.4.0/24"]

# NOTE: You can hardcode or fetch public_subnet_ids after applying VPC separately.
# If known:
public_subnet_ids = ["subnet-0123456789abcdef0", "subnet-abcdef0123456789"]

# EKS
eks_cluster_desired_size = 1
eks_cluster_max_size     = 2
eks_cluster_min_size     = 1
instance_type            = "t3.medium"

# Jenkins
jenkins_instance_type = "t3.medium"

availability_zones  = ["us-east-1a", "us-east-1b"]
vpc_cidr            = "10.0.0.0/16"
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]

key_name = "my-key"

ami_id = "ami-00a929b66ed6e0de6"