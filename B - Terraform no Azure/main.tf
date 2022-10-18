provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "rgteste" {
    name = "rg-teste"
    location = "brazilsouth"
}