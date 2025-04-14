output "jenkins_instance_public_ip" {
  description = "The public IP of the Jenkins EC2 instance"
  value       = aws_instance.jenkins_server.public_ip
}

output "jenkins_instance_private_ip" {
  description = "The private IP of the Jenkins EC2 instance"
  value       = aws_instance.jenkins_server.private_ip
}

output "jenkins_instance_id" {
  description = "The ID of the Jenkins EC2 instance"
  value       = aws_instance.jenkins_server.id
}

output "jenkins_security_group_id" {
  description = "The security group ID attached to the Jenkins EC2 instance"
  value       = aws_security_group.jenkins_sg.id
}
