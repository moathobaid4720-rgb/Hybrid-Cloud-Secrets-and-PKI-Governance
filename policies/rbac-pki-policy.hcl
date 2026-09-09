# Policy Name: rbac-pki-policy.hcl
# Description: Enterprise RBAC Policy for Automated Certificate Issuance & Secrets Access

# Permit read and list access to PKI certificate issuing endpoints
path "pki_int/issue/dot-com-cert" {
  capabilities = ["create", "update"]
}

# Allow read access to public CA certificate chain
path "pki_int/cert/ca_chain" {
  capabilities = ["read"]
}

# Deny root key capabilities for auditing and security boundaries
# This aligns with strict compliance mandates (PCI-DSS)
path "pki/root/*" {
  capabilities = ["deny"]
}

# Audit trail logging access for SIEM integration
path "sys/audit/*" {
  capabilities = ["read", "list"]
}
