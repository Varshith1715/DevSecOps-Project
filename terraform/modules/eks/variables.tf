variable "aws_region" {
  description = "AWS region to deploy EKS"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where EKS will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "public_subnet_ids" {
  description = "Public subnet IDs for EKS"
  type        = list(string)
}

variable "name_prefix" {
  description = "Name prefix for naming AWS resources"
  type        = string
}

variable "desired_capacity" {
  description = "Desired number of worker nodes in EKS"
  type        = number
}

variable "max_capacity" {
  description = "Maximum number of worker nodes in EKS"
  type        = number
}

variable "min_capacity" {
  description = "Minimum number of worker nodes in EKS"
  type        = number
}

variable "instance_type" {
  description = "Instance type for EKS worker nodes"
  type        = string
}
