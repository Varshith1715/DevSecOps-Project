# General Config
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for naming resources"
  type        = string
}

# VPC Variables
variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
}

variable "subnet_cidr_blocks_public" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "subnet_cidr_blocks_private" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

# EKS Variables
variable "public_subnet_ids" {
  description = "Public subnet IDs for EKS worker nodes"
  type        = list(string)
}

variable "eks_cluster_desired_size" {
  description = "Desired number of EKS worker nodes"
  type        = number
}

variable "eks_cluster_max_size" {
  description = "Max number of EKS worker nodes"
  type        = number
}

variable "eks_cluster_min_size" {
  description = "Min number of EKS worker nodes"
  type        = number
}

variable "instance_type" {
  description = "EC2 instance type for EKS worker nodes"
  type        = string
}

# Jenkins EC2
variable "jenkins_instance_type" {
  description = "EC2 instance type for Jenkins"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "key_name" {
  type        = string
  description = "Name of EC2 key pair"
}

variable "ami_id" {
  description = "AMI ID for Jenkins EC2 instance"
  type        = string
}
