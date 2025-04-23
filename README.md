
# 🚀 Secure DevSecOps CI/CD Pipeline for Taxi Booking Application

This project implements a secure and scalable CI/CD pipeline for a Java-based Taxi Booking application using Jenkins, Docker, Kubernetes (Amazon EKS), and Terraform. It integrates DevSecOps best practices including static analysis, container vulnerability scanning, dynamic application testing, and Kubernetes policy enforcement.

![Architecture Diagram](./A_digital_diagram_showcases_a_DevSecOps_CI/CD_Pipe.png)

---

## 📦 Repository Structure
```
.
├── opa/
│   └── policies/
│       ├── privileged-constraint.yaml
│       ├── privileged-template.yaml
│       ├── trusted-registry-constraint.yaml
│       └── trusted-registry-template.yaml
├── server/
├── taxi-booking/
│   └── pom.xml
├── terraform/
│   ├── main.tf
│   ├── outputs.tf
│   ├── provider.tf
│   ├── terraform.tfvars
│   ├── variables.tf
│   ├── helm_release.tf
│   └── modules/
│       ├── eks/
│       ├── jenkins/
│       └── vpc/
├── web-app-chart/
│   ├── Chart.yaml
│   ├── values.yaml
│   └── templates/
│       ├── deployment.yaml
│       └── service.yaml
├── Dockerfile
├── Jenkinsfile
└── README.md
```

---

## 🛠 Tools & Technologies

- **CI/CD**: Jenkins
- **Infrastructure as Code**: Terraform
- **Containerization**: Docker
- **Kubernetes Deployment**: Amazon EKS, Helm
- **Security**:
  - **SAST**: Semgrep
  - **Image Scanning**: Trivy
  - **DAST**: OWASP ZAP
  - **Policy Enforcement**: OPA Gatekeeper

---

## 🔁 CI/CD Workflow

1. **Code Push** → GitHub
2. **Jenkins Build Trigger** (via webhook)
3. **Semgrep** → Source code static analysis
4. **Docker Build** → Image created
5. **Trivy Scan** → Image vulnerability scan
6. **DockerHub Push** (if secure)
7. **Helm Deploy** → Deployed to Amazon EKS
8. **OPA Gatekeeper** → Policy validation
9. **OWASP ZAP** → Live security scan

---

## 🚀 Getting Started

### 🔧 Prerequisites

- AWS CLI configured (`aws configure`)
- Docker
- Jenkins (self-hosted or EC2)
- Terraform (`v1.4+`)
- Helm (`v3+`)
- kubectl
- Semgrep
- Trivy
- OWASP ZAP Docker container

---

## 🧪 Deployment Steps

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/taxi-booking-secure-cicd.git
cd taxi-booking-secure-cicd
```

### 2. Provision AWS Infrastructure with Terraform

```bash
cd terraform
terraform init
terraform apply -auto-approve
```

### 3. Configure Jenkins

- Install necessary plugins (Pipeline, Docker, Kubernetes CLI, GitHub, etc.)
- Set up pipeline using the `Jenkinsfile`

### 4. Trigger Pipeline

- Push code to GitHub to trigger the Jenkins job and pipeline stages

### 5. Access the Application

- Once deployed, use the EKS LoadBalancer/NodePort URL to access the application.

---

## 🔐 Security Enforcement with OPA

OPA Gatekeeper constraints and templates are located in:

```
├── opa/
│   └── policies/
│       ├── privileged-constraint.yaml
│       ├── privileged-template.yaml
│       ├── trusted-registry-constraint.yaml
│       └── trusted-registry-template.yaml
```

Apply them to enforce security best practices at the admission controller level.

---

## 📦 Helm Chart

The Helm chart for Kubernetes deployment is located at `web-app-chart/`.

```
├── web-app-chart/
│   ├── Chart.yaml
│   ├── values.yaml
│   └── templates/
│       ├── deployment.yaml
│       └── service.yaml
```

---

## 📂 Setup & Tool Installation

Detailed instructions for installing Jenkins, Docker, Helm, kubectl, and configuring AWS EKS and Jenkins can be found [here →](./setup-docs/installation.md)

---

---

## ✉️ Contact

**Pasupunuri Varshith**  
🌐 Cloud & DevSecOps Enthusiast  
📧 [pasupunurivarshith@gmail.com]

---

