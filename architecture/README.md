# Enterprise Security Architecture — Low-Level Design (LLD)

```mermaid
flowchart TB
    subgraph "1. Identity & Access Layer"
        A1[DevOps / CI-CD Pipeline]
        A2[Microservices / Applications]
        A3[Security Admins]
    end

    subgraph "2. Authentication & API Gateway"
        B1{Vault Auth Methods}
        A1 -->|Terraform / CI-CD| B1
        A2 -->|AppRole / K8s Auth| B1
        A3 -->|OIDC / LDAP| B1
    end

    subgraph "3. Policy & Governance Engine"
        C1(RBAC Policies)
        C2(Sentinel / OPA Policies)
        B1 -->|Token Issue| C1
        C1 -->|Validate Request| C2
    end

    subgraph "4. Core Secrets & PKI Operations"
        D1[PKI Secrets Engine\nIntermediate CA]
        D2[KV Secrets Engine\nStatic Secrets]
        D3[Transit Engine\nData Encryption]
        
        C2 -->|Issue / Revoke Certs| D1
        C2 -->|Read / Write| D2
        C2 -->|Encrypt / Decrypt| D3
    end

    subgraph "5. Storage & Hardware Root of Trust"
        E1[(Raft Storage Backend)]
        E2[Hardware Security Module - HSM\ne.g., Thales payShield 10K]
        
        E1 ==>|Auto-Unseal & Master Key Wrap| E2
    end

    subgraph "6. Observability & SIEM"
        F1[Vault Audit Device]
        F2[Enterprise SIEM]
        
        D1 & D2 & D3 -->|Log Events| F1
        F1 -->|Syslog Stream| F2
    end
