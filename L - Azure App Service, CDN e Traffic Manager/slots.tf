provider "azurerm" {
  features {
    
  }
}

resource "azurerm_resource_group" "rgteste" {
  name = "rg-appserviceslots"
  location = "brazilsouth"
}

resource "azurerm_service_plan" "planteste" {
  name = "plan-teste-slots"
  resource_group_name = azurerm_resource_group.rgteste.name
  location = azurerm_resource_group.rgteste.location
  os_type = "Windows"
  sku_name = "S1"
}

resource "azurerm_windows_web_app" "appslots" {
  name = "app-teste-slots"
  resource_group_name = azurerm_resource_group.rgteste.name
  location = azurerm_resource_group.rgteste.location
  service_plan_id = azurerm_service_plan.planteste.id
  site_config {
    
  }
}
resource "azurerm_windows_web_app_slot" "slottest" {
  name = "teste"
  app_service_id = azurerm_windows_web_app.appslots.id
  site_config {
    
  }
}