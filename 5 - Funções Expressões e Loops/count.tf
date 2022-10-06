resource "azurerm_resource_group" "grupoexemplocount" {
    count = 2
  name = "grupo-exemplar-${count.index}"
  location = "brazilsouth"
}

resource "azurerm_virtual_network" "vnet2" {
  name = "vnet1"
  resource_group_name = "grupo-exemplar-1"
  location = "brazilsouth"
  address_space = [ "10.0.0.1" ]
}
resource "azurerm_virtual_network" "vnet1" {
  name = "vnet2"
  resource_group_name = "grupo-exemplar-2"
  location = "brazilsouth"
  address_space = [ "10.0.0.1" ]
}