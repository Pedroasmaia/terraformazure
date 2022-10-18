provider "azurerm" {
  features {}
}

variable "local" {
  default = "westus2"
}

resource "azurerm_resource_group" "name" {
  name     = "rg-training-dev"
  location = var.local
}

resource "azurerm_storage_account" "storage" {
  name                      = "testestaticdev"
  location                  = var.local
  resource_group_name       = azurerm_resource_group.name.name
  account_kind              = "StorageV2"
  account_tier = "Standard"
  account_replication_type  = "LRS"
  enable_https_traffic_only = true

  static_website {
    index_document = "index.html"
  }
}
