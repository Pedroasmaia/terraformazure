provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-teste"
  location = "brazilsouth"
}

resource "azurerm_mariadb_server" "mariadbserver" {
  name                         = "mariadbserver"
  location                     = azurerm_resource_group.rg.location
  resource_group_name          = azurerm_resource_group.rg.name
  sku_name                     = "B_Gen5_2"
  storage_mb                   = 5120
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  ssl_enforcement_enabled      = false
  administrator_login          = "admin"
  administrator_login_password = "888888@"
  version                      = "10.2"
}
resource "azurerm_mariadb_database" "mariadb" {
  name                = "mariadbdabase"
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_mariadb_server.mariadbserver.name
  charset             = "utf8"
  collation           = "utf8_general_ci"

}
resource "azurerm_mariadb_firewall_rule" "allowazure" {
  name                = "allowazure"
  resource_group_name = azurerm_mariadb_server.mariadbserver.resource_group_name
  server_name         = azurerm_mariadb_server.mariadbserver.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}
