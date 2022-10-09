provider "azurerm" {
  features{}
}

resource "azurerm_resouce_group" "rg" {
  name = "rg-teste"
  location = "westus2"
  tags = {
    "env" : "dev"
  }
}