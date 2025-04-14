# VPC Module
module "vpc" {
  source              = "./modules/vpc"
  availability_zones  = var.availability_zones
  name_prefix         = var.name_prefix
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
}

# EKS Module
module "eks" {
  source            = "./modules/eks/"
  aws_region        = var.aws_region
  vpc_id            = module.vpc.vpc_id
  subnet_ids        = module.vpc.subnet_ids
  name_prefix       = var.name_prefix
  public_subnet_ids = var.public_subnet_ids
  desired_capacity  = var.eks_cluster_desired_size
  max_capacity      = var.eks_cluster_max_size
  min_capacity      = var.eks_cluster_min_size
  instance_type     = var.instance_type
}

# Jenkins EC2 Module
module "jenkins" {
  source            = "./modules/jenkins"
  key_name          = var.key_name
  ami_id            = var.ami_id
  subnet_id         = module.vpc.subnet_ids[0]
  security_group_id = module.vpc.jenkins_sg_id

  aws_region            = var.aws_region
  vpc_id                = module.vpc.vpc_id
  subnet_ids            = module.vpc.subnet_ids
  eks_cluster_name      = module.eks.cluster_name
  jenkins_instance_type = var.jenkins_instance_type
}


