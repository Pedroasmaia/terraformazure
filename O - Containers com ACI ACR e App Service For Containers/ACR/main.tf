provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rgacrpoc" {
  name     = "rg-acr-poc"
  location = "westus2"
}

resource "azurerm_container_registry" "acrpoc" {
  name                = "pedroacrpoc"
  resource_group_name = azurerm_resource_group.rgacrpoc.name
  location            = azurerm_resource_group.rgacrpoc.location
  sku                 = "Basic"
  admin_enabled       = true
}

output "adminuser" {
  value = azurerm_container_registry.acrpoc.admin_username
}
output "adminpass" {
  value = azurerm_container_registry.acrpoc.admin_password
  sensitive = true
}