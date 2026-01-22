<h1 align="center">🚀 Monolithic 3-Tier Application Deployment on Azure</h1>

<p align="center">
  <b>End-to-End CI/CD Automation using Azure DevOps Pipelines</b><br><br>
  ⚛️ ReactJS &nbsp;•&nbsp; 🐍 Python &nbsp;•&nbsp; 🗄️ Azure MS SQL &nbsp;•&nbsp; ☁️ Azure Virtual Machine
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Azure-DevOps-blue?logo=azuredevops" />
  <img src="https://img.shields.io/badge/CI/CD-Automated-success" />
  <img src="https://img.shields.io/badge/Architecture-3--Tier-important" />
  <img src="https://img.shields.io/badge/IaC-Terraform-623CE4?logo=terraform" />
</p>

<hr/>

<h2>📌 Project Overview</h2>

<p>
This project demonstrates a <b>Monolithic 3-Tier Application</b> deployed on
<b>Microsoft Azure</b> using a fully automated
<b>Azure DevOps CI/CD Pipeline</b> and <b>Terraform Infrastructure as Code (IaC)</b>.
</p>

<p>
The complete application lifecycle is automated:
</p>

<p align="center">
<b>Code Commit → Build → Test → Artifact Creation → Deployment</b>
</p>

<p>
This ensures fast, reliable, repeatable, and production-ready deployments 🚀
</p>

<hr/>

<h2>🧠 Application Architecture (3-Tier)</h2>

<ul>
  <li>
    <b>🎨 Frontend (ReactJS)</b>
    <ul>
      <li>ReactJS application built via Azure DevOps pipeline</li>
      <li>Production build stored as pipeline artifact</li>
      <li>Artifact deployed on Azure Virtual Machine using NGINX</li>
    </ul>
  </li>
  <br/>
  <li>
    <b>⚙️ Backend (Python)</b>
    <ul>
      <li>Python-based REST APIs</li>
      <li>Handles business logic</li>
      <li>Securely connects to database using connection string</li>
    </ul>
  </li>
  <br/>
  <li>
    <b>🗄️ Database (Azure MS SQL)</b>
    <ul>
      <li>Managed Azure MS SQL Database</li>
      <li>Secure and scalable cloud database layer</li>
    </ul>
  </li>
</ul>

<hr/>

<h2>🏗️ Architecture & CI/CD Flow</h2>

<table align="center">
  <tr>
    <td align="center">
      👤 <br/>
      <b>User</b>
    </td>
  </tr>
  <tr>
    <td align="center">⬇️</td>
  </tr>
  <tr>
    <td align="center" style="border:1px solid #ddd; padding:10px;">
      🌐 <br/>
      <b>Frontend</b><br/>
      ReactJS<br/>
      Hosted on Azure VM (NGINX)
    </td>
  </tr>
  <tr>
    <td align="center">⬇️</td>
  </tr>
  <tr>
    <td align="center" style="border:1px solid #ddd; padding:10px;">
      ⚙️ <br/>
      <b>Backend</b><br/>
      Python REST APIs<br/>
      Business Logic Layer
    </td>
  </tr>
  <tr>
    <td align="center">⬇️</td>
  </tr>
  <tr>
    <td align="center" style="border:1px solid #ddd; padding:10px;">
      🗄️ <br/>
      <b>Database</b><br/>
      Azure MS SQL<br/>
      Secure Connection String
    </td>
  </tr>
</table>

<p align="center">
<b>Frontend ↔ Backend ↔ Database</b> communication follows a secure and scalable 3-tier architecture.
</p>


<hr/>

<h2>🛠️ Technology Stack</h2>

<table>
  <tr>
    <th>Layer</th>
    <th>Technology</th>
  </tr>
  <tr>
    <td>Frontend</td>
    <td>⚛️ ReactJS</td>
  </tr>
  <tr>
    <td>Backend</td>
    <td>🐍 Python</td>
  </tr>
  <tr>
    <td>Database</td>
    <td>🗄️ Azure MS SQL</td>
  </tr>
  <tr>
    <td>CI/CD</td>
    <td>🔁 Azure DevOps Pipelines</td>
  </tr>
  <tr>
    <td>Infrastructure</td>
    <td>🌍 Terraform (IaC)</td>
  </tr>
  <tr>
    <td>Cloud</td>
    <td>☁️ Microsoft Azure</td>
  </tr>
  <tr>
    <td>Compute</td>
    <td>🖥️ Azure Virtual Machine</td>
  </tr>
</table>

<hr/>

<h2>✨ Key Features</h2>

<ul>
  <li>✔️ Fully automated CI/CD pipeline using Azure DevOps</li>
  <li>✔️ Monolithic 3-Tier architecture implementation</li>
  <li>✔️ Artifact-based deployment strategy</li>
  <li>✔️ Secure backend–database integration</li>
  <li>✔️ Infrastructure provisioning using Terraform</li>
  <li>✔️ Cloud-ready and scalable Azure solution</li>
</ul>

<hr/>

<h2>📂 Repository Structure</h2>

<pre>
├── frontend/                 # ReactJS Application
├── backend/                  # Python Backend APIs
├── azure-pipelines/          # Azure DevOps Pipeline YAML
├── scripts/                  # VM setup scripts (NGINX, Python)
├── Environment/
│   ├── dev/                  # Dev environment Terraform configs
│   └── prod/                 # Prod environment Terraform configs
├── Modules/                  # Reusable Terraform modules
│   ├── azurerm_compute/
│   ├── azurerm_networking/
│   ├── azurerm_key_vault/
│   ├── azurerm_public_ip/
│   └── azurerm_resource_group/
└── README.md                 # Project Documentation
</pre>

<hr/>

<h2>🚀 Deployment Summary</h2>

<p>
The <b>Azure DevOps CI/CD pipeline</b> automates the complete deployment process,
eliminating manual intervention.
</p>

<p>
Build artifacts ensure <b>consistent, reliable, and repeatable deployments</b>
across environments.
</p>

<p>
Infrastructure provisioning is handled using <b>Terraform</b>, and the application
is successfully deployed on an <b>Azure Virtual Machine</b> with a
<b>production-ready setup</b>.
</p>

<hr/>

<h2>👩‍💻 Author</h2>

<p>
<b>Priya Jaiswal</b><br/>
🚀 DevOps Fresher | Azure | CI/CD | Terraform
</p>

<hr/>

<p align="center">
⭐ If you like this project, don’t forget to <b>star the repository</b> ⭐
</p>



