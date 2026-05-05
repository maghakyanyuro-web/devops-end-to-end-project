# 🚀 Multi-Cloud Automated Infrastructure & Microservices Deployment

![DevOps](https://shields.io)
![Terraform](https://shields.io)
![Ansible](https://shields.io)
![Docker](https://shields.io)

A comprehensive, end-to-end DevOps project demonstrating the orchestration of a microservices architecture. This project automates the entire lifecycle—from cloud provisioning and configuration management to container orchestration and real-time monitoring.

---

## 🏗️ System Architecture

This project implements a highly scalable infrastructure on **AWS**, managed through the following layers:

*   **Infrastructure Provisioning:** Automated creation of EC2 instances and Security Groups using **Terraform**.
*   **Configuration Management:** Seamless environment setup (Docker, Git, Dependencies) across multiple nodes using **Ansible**.
*   **Application Orchestration:** Deployment of a full-stack application (Frontend, Backend, Database) via **Docker Compose**.
*   **Observability Stack:** Real-time monitoring and visualization using **Prometheus** and **Grafana**.
*   **Continuous Integration:** Infrastructure validation and automated workflows via **GitHub Actions**.

---

## 🛠️ Technology Stack


| Category | Tools |
| :--- | :--- |
| **Cloud Provider** | AWS (EC2, VPC, Security Groups) |
| **IaC** | Terraform |
| **Automation** | Ansible |
| **Containerization** | Docker, Docker Compose |
| **Monitoring** | Prometheus, Grafana |
| **CI/CD** | GitHub Actions |

---

## 🚀 Execution Guide

### 1. Provision Infrastructure
Initialize and deploy the AWS resources. Terraform will automatically generate the dynamic inventory for Ansible.
```bash
cd Terraform
terraform init
terraform apply -auto-approve
```

### 2. Configure & Deploy
Trigger the Ansible playbook to configure the remote nodes and launch the containerized application.
```bash
ansible-playbook -i inventory.ini install_app.yml --private-key=gndak.pem
```

### 3. Launch Monitoring
Deploy the observability stack on the management node.
```bash
cd monitoring
docker-compose up -d
```

---

## 📊 Observability & Metrics
Once deployed, the system health and performance metrics are accessible via the **Grafana Dashboard**.
*   **Grafana:** `http://<Main_Server_IP>:3001` (Default credentials: `admin/admin`)
*   **Prometheus:** `http://<Main_Server_IP>:9090`

---
