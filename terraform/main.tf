# Main Terraform configuration for Vault PKI & Secrets Engines

terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 3.19.0"
    }
  }
}

provider "vault" {
  address = var.vault_address
  token   = var.vault_token
}

# 1. Enable the PKI Secrets Engine
resource "vault_mount" "pki" {
  path                      = "pki"
  type                      = "pki"
  description               = "Enterprise Root CA PKI Engine"
  default_lease_ttl_seconds = 315360000 # 10 years
  max_lease_ttl_seconds     = 315360000 # 10 years
}

# 2. Generate the Root Certificate Authority (Self-Signed)
resource "vault_pki_secret_backend_root_cert" "root" {
  backend              = vault_mount.pki.path
  type                 = "internal"
  common_name          = "Enterprise Internal Root CA"
  ttl                  = var.pki_max_lease_ttl
  format               = "pem"
  private_key_format   = "der"
  key_type             = "rsa"
  key_bits             = 4096
  exclude_cn_from_sans = true
}
