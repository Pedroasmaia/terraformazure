resource "azurerm_traffic_manager_profile" "trafficprofile" {
  name = "trafic-teste"
  resource_group_name = azurerm_resource_group.rgteste.name
  traffic_routing_method = "Geographic"

  dns_config {
    relative_name = "geo"
    ttl = 100
  }
  monitor_config {
    protocol = "HTTPS"
    port = "80"
    path = "/"
    interval_in_seconds = 30
    timeout_in_seconds = 9
    tolerated_number_of_failures = 4
  }

}
resource "azurerm_service_plan" "planbr" {
  name = "appserviceplanbr"
  resource_group_name = azurerm_resource_group.rgteste.name
  location = "brazilsouth"
  sku_name = "B1"
  os_type = "Windows"
}
resource "azurerm_windows_web_app" "appservicebr" {
  name = "appservicebrazil"
  resource_group_name = azurerm_service_plan.planbr.resource_group_name
  location = azurerm_service_plan.planbr.location
  service_plan_id = azurerm_service_plan.planbr.id
  site_config {
  }
}
resource "azurerm_service_plan" "planwest" {
  name = "appserviceplanwest"
  resource_group_name = azurerm_resource_group.rgteste.name
  location = "westus2"
  sku_name = "B1"
  os_type = "Windows"
}
resource "azurerm_windows_web_app" "appservicewsetus2" {
  name = "appservicewestus2"
  resource_group_name = azurerm_service_plan.planwest.resource_group_name
  location = "Westus2"
  service_plan_id = azurerm_service_plan.planwest.location
  site_config {
  }
}
resource "azurerm_service_plan" "planworld" {
  name = "appserviceplanworld"
  resource_group_name = azurerm_resource_group.rgteste.name
  location = "uksouth"
  sku_name = "B1"
  os_type = "Windows"
}
resource "azurerm_windows_web_app" "appserviceworld" {
  name = "appserviceworld"
  resource_group_name = azurerm_service_plan.planworld.resource_group_name
  location = "uksouth"
  service_plan_id = azurerm_service_plan.planworld.location
  site_config {
  }
}

resource "azurerm_traffic_manager_azure_endpoint" "appservicenobr" {
  name = "appbr"
  profile_id = azurerm_traffic_manager_profile.trafficprofile.id
  target_resource_id = azurerm_windows_web_app.appservicebr.id
  weight = 100
  geo_mappings = [ "BR" ]
}
resource "azurerm_traffic_manager_azure_endpoint" "appservicenoeua" {
  name = "appeua"
  profile_id = azurerm_traffic_manager_profile.trafficprofile.id
  target_resource_id = azurerm_windows_web_app.appservicewsetus2.id
  weight = 101
  geo_mappings = [ "EUA" ]
}
resource "azurerm_traffic_manager_azure_endpoint" "appservicenouk" {
  name = "appeuk"
  profile_id = azurerm_traffic_manager_profile.trafficprofile.id
  target_resource_id = azurerm_windows_web_app.appserviceworld.id
  weight = 102
  geo_mappings = [ "WORLD" ]
}