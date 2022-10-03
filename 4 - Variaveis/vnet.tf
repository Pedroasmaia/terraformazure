resource "azurerm_virtual_network" "vnet" {
  name = "vnet-teste"
  resource_group_name = azurerm_resource_group.recursogp.name
  location = var.localtion
  address_space = var.vnetadress
}