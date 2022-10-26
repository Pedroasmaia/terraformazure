provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-teste"
  location = "brazilsouth"
}

resource "azurerm_postgresql_server" "postgreeserver" {
  name = "elefentesql"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  sku_name = "B_Gen5_2"
  storage_mb = 5120
  backup_retention_days = 7
  version = "9.5"
  geo_redundant_backup_enabled = false
  administrator_login = "mynameisadmin"
  administrator_login_password = "847hdaa@"
  infrastructure_encryption_enabled = false
  ssl_enforcement_enabled = false
}
resource "azurerm_postgresql_database" "post"{
  name = "elefante-base-tf"
  resource_group_name = azurerm_resource_group.rg.name
  server_name = azurerm_postgresql_server.postgreeserver.name
  charset = "UTF8"
  collation = "en_US"
}
resource "azurerm_postgresql_firewall_rule" "allowazure" {
  name                = "allowazure"
  resource_group_name = azurerm_postgresql_server.postgreeserver.resource_group_name
  server_name         = azurerm_postgresql_server.postgreeserver.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}
