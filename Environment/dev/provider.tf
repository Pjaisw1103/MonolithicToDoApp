terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.52.0"
    }
  }
   backend "azurerm" {
      resource_group_name  = "backendresource"
      storage_account_name = "newbackendstorage"
      container_name       = "tfstate"
      key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "80304407-f80e-4a01-9b2c-197d855b6fb6"
}