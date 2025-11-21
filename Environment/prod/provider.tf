terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.54.0"
    }
  }
    backend "azurerm" {
      resource_group_name  = "rg-backend"
      storage_account_name = "tfstate1230"
      container_name       = "tfcontainer"
      key                  = "demo.terraform.tfstate"
    }
}

provider "azurerm" {
  features {}
  subscription_id = "80304407-f80e-4a01-9b2c-197d855b6fb6"
}
