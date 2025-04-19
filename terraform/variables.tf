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
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones"
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

variable "key_name" {
  description = "Name of EC2 key pair"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for Jenkins EC2 instance"
  type        = string
}
