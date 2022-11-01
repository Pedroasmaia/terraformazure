provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rgacipoc" {
  name     = "rg-aci-poc"
  location = "westus2"
}
resource "azurerm_container_group" "aci" {
  name                = "aci-poc"
  location            = azurerm_resource_group.rgacipoc.location
  resource_group_name = azurerm_resource_group.rgacipoc.name
  ip_address_type     = "Public"
  dns_name_label      = "aci-treinamentopoc"
  os_type             = "Linux"
  image_registry_credential {
    username = "getinacr"
    password = "getinacr"
    server   = "getinacr"
  }
  container {
    name   = "acrregistry"
    image  = "valornoacr"
    cpu    = 0.5
    memory = 1.5
    ports {
      port     = 443
      protocol = "TCP"
    }
    ports {
      port     = 80
      protocol = "TCP"
    }
  }
}
