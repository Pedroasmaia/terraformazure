terraform {
  backend "azurerm"{
      subscription_id = "subscription_id" #Isso não consta no curso, apos enfrentar alguns erros 404, achei no stackoverflow
      resource_group_name = "resource_group_name"
      storage_account_name = "storage_account_name"
      container_name = "container_name"
      key = "key"
  }
}
provider "azurerm" {
    features {
      
    }
}

variable "location" {
  type = "string"
  default = "westus2"
}

resource "azurerm_resource_group" "rg" {
  name = "appservice-rg-${lower(terraform.workspace)}"
  location = var.location
}

resource "azurerm_service_plan" "service_plan" {
  name = "appserviceplan-${lower(terraform.workspace)}"
  resource_group_name = azurerm_resource_group.rg.name
  location = var.location
  sku_name = "B1"
  os_type = "Windows"
}

resource "azurerm_windows_web_app" "appservice" {
  name = "appservice${lower(terraform.workspace)}"
  resource_group_name = azurerm_resource_group.rg.id
  location = var.location
  service_plan_id = azurerm_service_plan.service_plan.id
  site_config {
  }
}