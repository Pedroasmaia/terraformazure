provider "azurerm" {
  features {
    
  }
}

resource "azurerm_resource_group" "rgvnet" {
  name = "rgvnet"
  location = "brazilsouth"
  tags = {
    "env" = "dev"
  }
}
resource "azurerm_virtual_network" "vnet" {
  name = "vnet"
  resource_group_name =  azurerm_resource_group.rgvnet.name
  location = "brazilsouth"
  address_space = [ "10.0.0.0/16","192.168.0.1" ]
  tags = {
    "env" = "dev"
  }
}