import os
import requests

# Enterprise Automated Certificate Lifecycle Utility
# Author: Moath Obaid

VAULT_ADDR = os.getenv("VAULT_ADDR", "https://vault.internal.local:8200")
VAULT_TOKEN = os.getenv("VAULT_TOKEN", "root")

def request_certificate(common_name):
    url = f"{VAULT_ADDR}/v1/pki_int/issue/dot-com-cert"
    headers = {"X-Vault-Token": VAULT_TOKEN}
    payload = {
        "common_name": common_name,
        "ttl": "720h"
    }
    
    print(f"[*] Requesting X.509 certificate for: {common_name}")
    try:
        response = requests.post(url, json=payload, headers=headers, verify=True)
        if response.status_code == 200:
            print("[+] Certificate successfully issued!")
            return response.json()['data']
        else:
            print(f"[-] Failed to issue certificate: {response.status_code} - {response.text}")
    except Exception as e:
        print(f"[!] Error connecting to Vault: {str(e)}")

if __name__ == "__main__":
    # Test execution placeholder
    print("[*] Initiating Automated PKI Lifecycle Pipeline...")
