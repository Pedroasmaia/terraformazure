provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-teste"
  location = "westus2"
}
#! Azure SQL Server
resource "azurerm_mssql_server" "sqlserver" {
  name                         = "sqlcursotf"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "mradministrator"
  administrator_login_password = "thisIsDog11"

  tags = {
    environment = "production"
  }
}
#!  Database
resource "azurerm_mssql_database" "test" {
  name      = "acctest-db-d"
  server_id = azurerm_mssql_server.sqlserver.id
  collation = "SQL_Latin1_General_CP1_CI_AS"
  sku_name  = "basic"
}
#! Regra de Firewall do servidor
resource "azurerm_mssql_firewall_rule" "Firewallsql" {
  name             = "Ip do Pedro"
  server_id        = azurerm_mssql_server.sqlserver.id
  start_ip_address = "172.97.199.72"
  end_ip_address   = "172.97.199.72"
}
#! Regra de Firewall liberado Apps do Azure
resource "azurerm_mssql_firewall_rule" "AzureAllow" {
  name             = "AllowAzureService"
  server_id        = azurerm_mssql_server.sqlserver.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}
#! Azure SQL Elastic Pool
resource "azurerm_mssql_elasticpool" "elasticpool" {
  name                = "mysql-elastc"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  server_name         = azurerm_mssql_server.sqlserver.name
  sku {
    name     = "BasicPool"
    tier     = "Basic"
    family   = "Gen4"
    capacity = 4
  }
  per_database_settings {
    min_capacity = 0.25
    max_capacity = 4
  }
}
