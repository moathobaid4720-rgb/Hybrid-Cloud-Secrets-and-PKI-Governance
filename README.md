# Hybrid-Cloud Secrets Management & PKI Governance Framework

## Overview
This repository provides an enterprise-grade, production-ready framework for automating Secrets Management, Public Key Infrastructure (PKI) lifecycle operations, and cryptographic governance across hybrid-cloud environments. It bridges the gap between strict regulatory mandates (such as PCI-DSS v4.0 and GDPR) and cloud-native automation using **HashiCorp Vault**, **Terraform**, and automated cryptographic validation pipelines.

---

## Architectural Highlights
- **Automated Certificate Lifecycle Management (ACLM):** Automates issuance, rotation, and revocation of internal X.509 certificates without human intervention.
- **Role-Based Access Control (RBAC):** Strict policy enforcement limiting cryptographic operations and secret retrieval based on principle of least privilege (PoLP).
- **Infrastructure as Code (IaC):** Entire deployment and configuration defined via Terraform for consistent multi-environment rollouts.
- **Compliance Alignment:** Built-in safeguards to maintain audit readiness for high-assurance environments (Banking, FinTech, and Government sectors).

---

## Repository Structure
- `terraform/`: Core infrastructure setup for secrets engines and PKI mounts.
- `policies/`: HCL-based security policies enforcing access control and cryptographic boundaries.
- `scripts/`: Python-based automation utilities for health checks and token/certificate rotation.
- `architecture/`: High-Level (HLD) and Low-Level (LLD) architectural diagrams.

---

## Author
**Moath Obaid**  
*Senior Cybersecurity Solutions Lead & Technical Strategist*  
[LinkedIn Profile](https://linkedin.com/in/moathobaid)
