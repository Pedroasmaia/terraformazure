provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "name" {
  name     = "rg-teste"
  location = "brazilsouth"
}

resource "azurerm_mysql_server" "mysql" {
  name                         = "mysqlservertf"
  location                     = azurerm_resource_group.name.location
  resource_group_name          = azurerm_resource_group.name.name
  sku_name                     = "B_Gen5_2"
  storage_mb                   = 5120
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  administrator_login          = "mysqladminun"
  administrator_login_password = "H@Sh1CoR3!"
  version                      = "5.7"
  ssl_enforcement_enabled      = false
  auto_grow_enabled            = true
}

resource "azurerm_mysql_database" "mysqldatabase" {
  name = "mysqldb-tf"
  resource_group_name = azurerm_resource_group.name.name
  server_name = azurerm_mysql_server.mysql.name
  charset = "utf8"
  collation = "utf8_general_ci"
}

resource "azurerm_mysql_firewall_rule" "rulesql" {
    name = "personalip"
    resource_group_name = azurerm_mysql_server.mysql.resource_group_name
    server_name = azurerm_mysql_database.mysqldatabase.name
    start_ip_address = "192.168.1.10"
    end_ip_address = "192.168.1.10"
  
}
resource "azurerm_mysql_firewall_rule" "allowazure" {
    name = "allowazure"
    resource_group_name = azurerm_mysql_server.mysql.resource_group_name
    server_name = azurerm_mysql_database.mysqldatabase.name
    start_ip_address = "0.0.0.0"
    end_ip_address = "0.0.0.0"
  
}