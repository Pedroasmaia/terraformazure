provider "azurerm" {
  features{

  }
}

resource "azurerm_resource_group" "rgvmtf" {
  name = "rg-vm-tf"
  location = "westus2"
}