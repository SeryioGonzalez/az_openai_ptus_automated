terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.93.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}

resource "azurerm_resource_group" "ptu-tf" {
  name     = "ptu-tf"
  location = "Sweden Central"
}

resource "azurerm_cognitive_account" "ptu-tf-account" {
  name                = "ptu-tf-account"
  location            = azurerm_resource_group.ptu-tf.location
  resource_group_name = azurerm_resource_group.ptu-tf.name
  kind                = "OpenAI"
  sku_name = "S0"
}

resource "azurerm_cognitive_deployment" "ptu-tf-account-deployment" {
  name                 = "ptu-tf-account-deployment"
  cognitive_account_id = azurerm_cognitive_account.ptu-tf-account.id
  model {
    format  = "OpenAI"
    name    = "gpt-4"
    version = "0613"
  }

  scale {
    type = "ProvisionedManaged"
    capacity = "100"
  }
}
