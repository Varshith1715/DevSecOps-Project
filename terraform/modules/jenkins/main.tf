# Security Group for Jenkins EC2
resource "aws_security_group" "jenkins_sg" {
  name_prefix = "jenkins-sg-"

  ingress {
    # Allow SSH access (for management)
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Open to all IPs (be cautious with this, use specific IPs in production)
  }

  ingress {
    # Allow HTTP access to Jenkins dashboard (default port 8080)
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Open to all IPs (be cautious with this, use specific IPs in production)
  }

  ingress {
  from_port   = 8090
  to_port     = 8090
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]  # Make restrictive if possible
}


  egress {
    # Allow all outbound traffic (you may limit it as needed)
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Jenkins-Security-Group"
  }
}

# Jenkins EC2 Instance with associated Security Group
resource "aws_instance" "jenkins_server" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.jenkins_sg.id]  # Link the security group here
  iam_instance_profile        = aws_iam_instance_profile.jenkins_instance_profile.name
  associate_public_ip_address = true

    user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install java-openjdk11 -y
              wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
              rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
              yum install jenkins git docker aws-cli -y
              systemctl enable jenkins
              systemctl start jenkins
              systemctl enable docker
              systemctl start docker
              usermod -aG docker jenkins

              # Install kubectl
              curl -o /usr/local/bin/kubectl -LO "https://dl.k8s.io/release/$(curl -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
              chmod +x /usr/local/bin/kubectl

              # Install Helm
              curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

              # Install Trivy
              rpm -ivh https://github.com/aquasecurity/trivy/releases/latest/download/trivy_0.50.1_Linux-64bit.rpm
              chmod +x /usr/bin/trivy
              chown jenkins:jenkins /usr/bin/trivy

              # Configure kubeconfig for Jenkins user
              mkdir -p /var/lib/jenkins/.kube
              chown -R jenkins:jenkins /var/lib/jenkins/.kube
              sudo -u jenkins aws eks update-kubeconfig --region us-east-1 --name eks_cluster --kubeconfig /var/lib/jenkins/.kube/config

              systemctl restart jenkins
              EOF
}

# IAM Role and Instance Profile for Jenkins EC2
resource "aws_iam_role" "jenkins_role" {
  name = "jenkins-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecr_access" {
  role       = aws_iam_role.jenkins_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  role       = aws_iam_role.jenkins_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "eks_worker_policy" {
  role       = aws_iam_role.jenkins_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "ssm" {
  role       = aws_iam_role.jenkins_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "jenkins_instance_profile" {
  name = "jenkins-ec2-instance-profile"
  role = aws_iam_role.jenkins_role.name
}
