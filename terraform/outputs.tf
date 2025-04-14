output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "eks_cluster_name" {
  description = "EKS Cluster Name"
  value       = module.eks.cluster_name
}

output "jenkins_instance_id" {
  description = "Jenkins EC2 instance ID"
  value       = module.jenkins.jenkins_instance_id
}
