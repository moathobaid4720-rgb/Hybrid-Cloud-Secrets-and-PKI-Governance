# Variable definitions for Vault Infrastructure

variable "vault_address" {
  description = "The address of the Vault server URL"
  type        = string
  default     = "http://127.0.0.1:8200"
}

variable "vault_token" {
  description = "Vault authentication token (Should be passed securely via CI/CD, not hardcoded)"
  type        = string
  sensitive   = true
}

variable "pki_max_lease_ttl" {
  description = "Maximum Time-to-Live for PKI certificates"
  type        = string
  default     = "87600h" # 10 Years for Root/Intermediate CA
}
