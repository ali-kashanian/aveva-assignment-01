terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.17.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "ali-rg-reference"
    storage_account_name = "alistiac"
    container_name       = "aveva-assignment-01"
    key                  = "terraform.tfstate"
  }
}  

provider "azurerm" {
  features {
  }
  subscription_id = var.subscription_id
}
