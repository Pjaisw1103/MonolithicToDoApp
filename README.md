<h1 align="center">🚀 Monolithic 3-Tier Application Deployment</h1>

<p align="center">
  <b>CI/CD Automation using Azure DevOps Pipelines</b><br>
  ⚛️ ReactJS • 🐍 Python • 🗄️ Azure MS SQL • ☁️ Azure VM
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Azure-DevOps-blue?logo=azuredevops" />
  <img src="https://img.shields.io/badge/CI/CD-Automated-success" />
  <img src="https://img.shields.io/badge/Architecture-3--Tier-important" />
</p>

---

## 📌 Project Overview

This project demonstrates a **Monolithic 3-Tier Application** deployed on **Microsoft Azure**
using a fully automated **Azure DevOps CI/CD Pipeline**.

The pipeline automates the complete lifecycle including  
**Build → Test → Artifact Creation → Deployment**, ensuring fast, reliable, and repeatable releases 🚀.

---

## 🧠 Application Architecture

The application follows a classic **3-Tier Architecture**:

- 🎨 **Frontend**: ReactJS  
  - Build generated using Azure DevOps  
  - Stored as an artifact  
  - Deployed on Azure Virtual Machine  

- ⚙️ **Backend**: Python  
  - Handles business logic and REST APIs  
  - Connected to database using secure connection string  

- 🗄️ **Database**: Azure MS SQL  
  - Secure, scalable cloud database  

---

## 🏗️ Architecture Flow Diagram

```text
👤 User
   |
   v
🌐 ReactJS Frontend (Azure VM)
   |
   v
⚙️ Python Backend
   |
   v
🗄️ Azure MS SQL Database

Code Commit (GitHub Repository)
        ↓
Azure DevOps Pipeline Triggered
        ↓
Build Stage
  - ReactJS Build
  - Python Backend Build
        ↓
Test Stage
        ↓
Artifact Creation
        ↓
Deployment Stage
  - Deploy to Azure Virtual Machine

## 🛠️ Technology Stack

| Layer     | Technology |
|----------|------------|
| Frontend | ⚛️ ReactJS |
| Backend  | 🐍 Python |
| Database | 🗄️ Azure MS SQL |
| CI/CD    | 🔁 Azure DevOps Pipelines |
| Cloud    | ☁️ Microsoft Azure |
| Compute  | 🖥️ Azure Virtual Machine |

---

## ✨ Key Features

- ✔️ Fully automated CI/CD using Azure DevOps  
- ✔️ Monolithic 3-Tier architecture  
- ✔️ Artifact-based deployment strategy  
- ✔️ Secure backend–database integration  
- ✔️ Cloud-ready and scalable solution  

---

## 📂 Repository Structure

```text
├── frontend/          # ReactJS Application
├── backend/           # Python Backend APIs
├── azure-pipelines/   # Azure DevOps Pipeline YAML
├── scripts/           # Deployment Scripts
└── README.md          # Project Documentation

## 🚀 Deployment Summary

The **Azure DevOps CI/CD pipeline** automates the complete deployment process, eliminating the need for any manual intervention.  
Build artifacts ensure **consistent, reliable, and repeatable deployments** across different environments.  
The application is successfully deployed on an **Azure Virtual Machine**, making it a **production-ready setup**.
