terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.80.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "avaaneurg1"
    tenant_id            = "93b28308-223b-42e0-88cd-b14aa5e81388"
    storage_account_name = "avaaneudevbckendsgacc1"
    container_name       = "avaaneudev-terraformbackend"
    key                  = "dev.tfstate"
  }
}

provider "azurerm" {
  features {}
}