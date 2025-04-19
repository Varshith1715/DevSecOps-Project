variable "aws_region" {
  description = "AWS region to deploy EKS"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where EKS will be deployed"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
}


variable "name_prefix" {
  description = "Name prefix for naming AWS resources"
  type        = string
}

variable "desired_size" {
  description = "Desired number of worker nodes in EKS"
  type        = number
}

variable "max_size" {
  description = "Maximum number of worker nodes in EKS"
  type        = number
}

variable "min_size" {
  description = "Minimum number of worker nodes in EKS"
  type        = number
}

variable "instance_type" {
  description = "Instance type for EKS worker nodes"
  type        = string
}
