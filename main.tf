terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }

  cloud {

    organization = "alexman-az"

    workspaces {
      name = "Hands-On_With_Terraform_On_Azure"
    }
  }
}

provider "azurerm" {
  subscription_id = "0cfe2870-d256-4119-b0a3-16293ac11bdc"
  features {

  }
  resource_provider_registrations = "none"
}

resource "azurerm_resource_group" "rg" {
  name     = "813-197d327e-hands-on-with-terraform-on-azure"
  location = "westus"
  
}

module "securestorage" {
  source               = "app.terraform.io/alexman-az/securestorage/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "alexmanazstg5679"
}