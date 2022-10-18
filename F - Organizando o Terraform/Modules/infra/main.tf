resource "azurerm_resource_group" "rg" {
  name = "appservice-rg-${lower(var.ambiente)}"
  location = var.location
}

resource "azurerm_service_plan" "service_plan" {
  name = "appserviceplan-${lower(var.ambiente)}"
  resource_group_name = azurerm_resource_group.rg.name
  location = var.location
  sku_name = "B1"
  os_type = "Windows"
}

resource "azurerm_windows_web_app" "appservice" {
  name = "appservice${lower(var.ambiente)}"
  resource_group_name = azurerm_resource_group.rg.id
  location = var.location
  service_plan_id = azurerm_service_plan.service_plan.id
  site_config {
  }
}