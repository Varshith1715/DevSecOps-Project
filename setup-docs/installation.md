
# 🛠️ Tool Installation & Setup Guide

This guide helps you install and configure all required tools for the Secure DevSecOps CI/CD Pipeline project.

---

## 📦 Update System and Add Jenkins Repo

```bash
sudo yum update -y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade -y
```

---

## ☕ Install Java & Jenkins

```bash
sudo yum install fontconfig java-21-openjdk -y
sudo yum install jenkins git docker aws-cli -y
sudo systemctl enable jenkins
sudo systemctl start jenkins
```

---

## 🐳 Enable and Start Docker

```bash
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker jenkins
```

---

## 📦 Install kubectl

```bash
curl -o /usr/local/bin/kubectl -LO "https://dl.k8s.io/release/$(curl -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x /usr/local/bin/kubectl
```

---

## ⎈ Install Helm

```bash
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
```

---

## 🛡️ Install Trivy for Vulnerability Scanning

```bash
curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sudo sh -s -- -b /usr/local/bin
chmod +x /usr/local/bin/trivy
chown jenkins:jenkins /usr/local/bin/trivy
```

---

## ⚙️ Configure kubeconfig for Jenkins

```bash
sudo mkdir -p /var/lib/jenkins/.kube
sudo chown -R jenkins:jenkins /var/lib/jenkins/.kube
sudo -u jenkins aws eks update-kubeconfig --region us-east-1 --name secure-cicd-eks --kubeconfig /var/lib/jenkins/.kube/config
```

---

## 🔁 Restart Jenkins

```bash
sudo systemctl restart jenkins
```
