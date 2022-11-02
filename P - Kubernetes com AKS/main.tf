provider "azurerm" {
  features{}
}

resource "azurerm_resource_group" "rgakspoc" {
  name = "rg-aks-poc"
  location = "westus2"
}
resource "azurerm_container_registry" "acrpoc" {
  name                = "acrpoctf"
  resource_group_name = azurerm_resource_group.rgakspoc.name
  location            = azurerm_resource_group.rgakspoc.location
  sku                 = "Basic"
  admin_enabled       = true
}

resource "azurerm_kubernetes_cluster" "aks" {
  name = "akstf"
  location = azurerm_resource_group.rgakspoc.location
  resource_group_name = azurerm_resource_group.rgakspoc.name
  dns_prefix = "akstf"
  default_node_pool {
    name = "agentpool"
    node_count = 2
    vm_size = "Standard_B2s"
  }
  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_role_assignment" "name" {
  scope = azurerm_container_registry.acrpoc.id
  role_definition_name = "Acrpull"
  principal_id = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}