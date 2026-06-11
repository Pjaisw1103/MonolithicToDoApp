# Multi-Environment Azure Infrastructure Setup

[![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=for-the-badge&logo=microsoftazure&logoColor=white)](https://azure.microsoft.com/)
[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![GitHub Actions](https://img.shields.io/badge/github%20actions-%232088FF.svg?style=for-the-badge&logo=githubactions&logoColor=white)](https://github.com/features/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

An enterprise-grade, highly secure, scalable, and fully automated multi-environment (Dev, Staging, Prod) 3-Tier Web Application Infrastructure deployment on Microsoft Azure using Infrastructure as Code (IaC).

---

## 🏗️ System Architecture

This repository provisions a secure, highly-available 3-tier architecture isolated inside private Virtual Networks (VNets), managed securely via Azure Bastion, and audited by Azure Monitor.

### Architecture Diagram
![Enterprise Azure Architecture](./Screenshot%202026-06-11%20111246.png)

---

## 📦 Resource Breakdown & Tier Explanations

The infrastructure is broken down hierarchically to mimic real-world enterprise cloud governance:

### 1. Management & Scope Layers
* **Management Group:** Enforces global enterprise policies and governance controls across subscriptions.
* **Subscription:** Acts as a hard billing and access boundary (e.g., isolating Non-Prod from Prod workloads).
* **Resource Group:** Logical container that lifecycle-manages resources bound to a specific application and environment.

### 2. Networking Tier (VNet & Subnets)
* **Virtual Network (VNet):** Configured with isolated address blocks dedicated per environment.
* **Frontend Subnet:** Houses the Internet-facing entry points guarded by rigid Network Security Groups (NSGs).
* **Backend Subnet:** Houses internal business-logic servers with no direct internet access.
* **Azure Bastion Subnet:** Dedicated subnet used to stream secure RDP/SSH tunnel traffic over TLS directly into your backend subnet instances from the Azure Portal.

### 3. Application & Compute Tier
* **Application Gateway:** Functions as an L7 load balancer, SSL offloader, and Web Application Firewall (WAF) routing user traffic into the Frontend subnets.
* **Frontend Virtual Machines (VMs):** Standard compute scale-sets that render client applications.
* **Internal Load Balancer:** Distributes traffic evenly from the Frontend VM pool down to the Backend VM layer.
* **Backend Virtual Machines (VMs):** Hosts API processing services, totally isolated from public web components.

### 4. Data & Secrets Tier
* **Private Endpoint:** Restricts traffic traveling to the database layer over a private IP network interface instead of public endpoints.
* **Azure SQL Database Server & DB:** Managed relational database tier holding transactional system data.
* **Azure Key Vault:** Central cryptographic vault housing application configuration strings, TLS certificates, and database admin secrets.

### 5. Observability Tier
* **Azure Monitor:** Tracks system performance metrics and infrastructure telemetry.
* **Log Analytics Workspace:** Consolidates logs from Network Security Groups, Application Gateways, and Virtual Machines for diagnostic auditing and querying.

---

## 🔄 End-to-End Traffic Flow

```text
[ User Browser ]
       │
       ▼ (HTTPS over Public Internet)
[ DNS (Azure Traffic Manager / Azure DNS) ]
       │
       ▼
[ Azure Application Gateway (L7 WAF) ]
       │
       ▼ (Routed securely into VNet)
[ Frontend Subnet / VMs ] ──► Protected by Frontend NSG
       │
       ▼
[ Internal Load Balancer ]
       │
       ▼
[ Backend Subnet / VMs ]  ──► Protected by Backend NSG
       │
       ▼ (Routed over Private Link)
[ Private Endpoint ]
       │
       ▼
[ Azure SQL Database Server ]
