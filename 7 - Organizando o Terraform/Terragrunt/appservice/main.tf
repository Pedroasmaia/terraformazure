resource "azurerm_resource_group" "rgteste" {
  name = var.rg
  location = var.local

}
resource "azurerm_service_plan" "service_plan" {
  name = "appserviceplan"
  resource_group_name = var.rg
  location = var.local
  sku_name = "B1"
  os_type = "Windows"
}

resource "azurerm_windows_web_app" "appservice" {
  name = "appservice"
  resource_group_name = var.rg
  location = var.local
  service_plan_id = azurerm_service_plan.service_plan.id
  site_config {
  }
}