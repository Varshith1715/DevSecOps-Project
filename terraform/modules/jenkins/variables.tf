variable "instance_type" {
  description = "The EC2 instance type for Jenkins server"
  type        = string
  default     = "t3.medium"  # You can adjust the default to fit your needs
}

variable "key_name" {
  description = "The name of the SSH key pair to access Jenkins EC2 instance"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID in which Jenkins EC2 instance will be launched"
  type        = string
}

variable "security_group_id" {
  description = "The security group ID to be associated with Jenkins EC2 instance"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID for Jenkins EC2 instance (e.g., Amazon Linux 2 AMI)"
  type        = string
  default     = "ami-0c55b159cbfafe1f0"  # You should replace this with the AMI ID relevant to your region
}

variable "aws_region" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "eks_cluster_name" {
  type = string
}

variable "jenkins_instance_type" {
  type = string
}
