# Configuring the azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = "3b2b30d9-8947-4b87-8f70-ca6ccb7a01ba"
  tenant_id       = "bc7a3598-1619-438a-a432-adad1e4e2b46"
  client_id       = "dee28ad8-dfbf-43fb-9c31-0663f1aa6fad"
  client_secret   = "zKx8Q~EwGJD12VY_HEYAHu9JV3kq~4rS.uGo.bun"
}

